{
  description = "My system configuration!";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Clrpkgs
    clrpkgs.url = "github:clr-cera/clrpkgs";
    clrpkgs.inputs = {
      nixpkgs.follows = "nixpkgs";
      flake-utils.follows = "flake-utils";
      home-manager.follows = "home-manager";
    };

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
  };


  outputs = { self, nixpkgs, home-manager, clrpkgs, ... }@inputs:
     let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in
     {
      packages = forAllSystems (sys:
        let 
          pkgs = nixpkgs.legacyPackages.${sys};
          
        in import ./pkgs { inherit pkgs; }
      );

      overlays = import ./overlays {inherit inputs;};

      nixosConfigurations = {
        #muse
        muse = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs;}; 
          modules = [ ./system/hosts/muse ];
        };    
      };

      homeConfigurations = 
      let clr = clrpkgs.packages.x86_64-linux;
          rices = clrpkgs.rices;
      in
      {
        #muse
        "clr@muse" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; 
          extraSpecialArgs = { inherit inputs outputs clr rices; }; 
          modules = [ ./home-manager/hosts/muse ];
        };
      };
    };
}
