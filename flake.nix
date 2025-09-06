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

  outputs = { nixpkgs, home-manager, nvf, nixpkgs-unstable, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      lib = pkgs.lib;

      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

      vimConfig = {
        config.vim =
          import ./home-manager/modules/nvf/bundle.nix { inherit pkgs lib; };
      };

      customNeovim = nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [ vimConfig ];
      };
    in {
      packages.${system}.vim = customNeovim.neovim;

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit unstable; };
        modules = [ ./system/configuration.nix ];
      };
      homeConfigurations.yash = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        extraSpecialArgs = { inherit inputs unstable; };

        modules = [
          { home.packages = [ customNeovim.neovim ]; }
          ./home-manager/home.nix
        ];
      };
    };
}
