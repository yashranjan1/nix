{
	description = "My system config";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nvf = {
			url = "github:notashelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	
	outputs = { nixpkgs, home-manager, nvf, ... } : 
		let 
			system = "x86_64-linux";
		in {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [ ./system/configuration.nix ];
		};
		homeConfigurations.takina = home-manager.lib.homeManagerConfiguration {
			pkgs = import nixpkgs {
				inherit system;
				config.allowUnfree = true;
			};
			modules = [ 
					nvf.homeManagerModules.default
					./home-manager/home.nix
			];
		};
	};
}
