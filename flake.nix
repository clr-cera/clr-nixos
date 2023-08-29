{
  description = "My system configuration!";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #hardware
    hardware.url = "github:nixos/nixos-hardware";

    #spicetify!
    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      #muse
      muse = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; }; 
        modules = [ ./system/hosts/muse ];
      };    
    };

    homeConfigurations = {
      #muse
      "clr@muse" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; 
        extraSpecialArgs = { inherit inputs; }; 
        modules = [ ./home-manager/hosts/muse ];
      };

    };
  };
}
