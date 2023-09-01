{
  description = "My system configuration!";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Flake-utils
    flake-utils.url = "github:numtide/flake-utils";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hardware
    hardware.url = "github:nixos/nixos-hardware";

    # Spicetify!
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    spicetify-nix.inputs = {
      nixpkgs.follows = "nixpkgs";
      flake-utils.follows = "flake-utils";
    };
    
    # VSCode
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    # ICMChat!!
    ICMChat.url = "github:clr-cera/ICMChat";
    ICMChat.inputs = {
      nixpkgs.follows = "nixpkgs";
      flake-utils.follows = "flake-utils";
    };
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
