{
	description = "My system config";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	
	outputs = { nixpkgs, home-manager, ... } : 
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
			modules = [ ./home-manager/home.nix ];
		};
	};
}
