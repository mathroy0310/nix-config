{
	description = "my NixOs config";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		zig.url = "github:mitchellh/zig-overlay";
	};

	outputs = {self, nixpkgs, home-manager, ...} @inputs: 
	 	let
			system = "x86_64-linux";
			pkgs = import nixpkgs {
				inherit system;
				config.allowUnfree = true;
			};
		in {
    	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
					inherit system;
					modules = [ 
						./configuration.nix 
						#	./modules/hyprland.nix
					];
			};
		
			homeConfigurations.maroy = home-manager.lib.homeManagerConfiguration {
					inherit pkgs;
					extraSpecialArgs = { inherit inputs; };

					modules = [
						{ nixpkgs.overlays = [ inputs.zig.overlays.default ]; }
						./users/maroy.nix
						./modules/crosscompilers.nix
						./modules/music-player.nix
					];
			};
		};
}
