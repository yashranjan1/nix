
{
  description = "My system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = { url = "github:notashelf/nvf"; };
    ags = { url = "github:aylur/ags"; };
  };

  outputs = { nixpkgs, self, home-manager, nvf, nixpkgs-unstable, ... }@inputs:
    let
      forAllSystems = f: nixpkgs.lib.genAttrs
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ]
        (system: f system);
    in {
      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          lib = pkgs.lib;

          unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };

          vimConfig = {
            config.vim = import ./home-manager/modules/nvf/bundle.nix {
              inherit pkgs lib;
            };
          };

          customNeovim = nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [ vimConfig ];
          };
        in {
          vim = customNeovim.neovim;
        });

      # keep your nixos config
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit nixpkgs-unstable; };
        modules = [ ./system/configuration.nix ];
      };

      # keep your home config (still Linux-only, unless you want Darwin too)
      homeConfigurations.yash = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = { inherit inputs nixpkgs-unstable; };
        modules = [
          { home.packages = [ self.packages."x86_64-linux".vim ]; }
          ./home-manager/home.nix
        ];
      };
    };
}

