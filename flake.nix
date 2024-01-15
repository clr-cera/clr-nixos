{
  description = "My system configuration!";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    oldnixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    
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

    hyprsome.url = "github:sopa0/hyprsome";
    hyprsome.inputs = {
      nixpkgs.follows = "nixpkgs";
      flake-utils.follows = "flake-utils";
    };
    # Mail stuff
    simple-nixos-mailserver.url = "gitlab:simple-nixos-mailserver/nixos-mailserver"; 
    simple-nixos-mailserver.inputs = {
      nixpkgs.follows = "nixpkgs";
      nixpkgs-22_11.follows = "nixpkgs";
      nixpkgs-23_05.follows = "nixpkgs";
      utils.follows = "flake-utils"; 
    };
  };

  outputs = {
    self,
    nixpkgs,
    oldnixpkgs,
    home-manager,
    clrpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];

    systems = {
      aarchLinux = "aarch64-linux";
      i686 = "i686-linux";
      linux64 = "x86_64-linux";
      aarchDarwin = "aarch64-darwin";
      darwin64 = "x86_64-darwin";
    };

    risotti = clrpkgs.risotti;
  in {
    packages = forAllSystems (
      sys: let
        pkgs = nixpkgs.legacyPackages.${sys};
      in
        import ./pkgs {inherit pkgs;}
    );

    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations = {
      #terpsichore
      terpsichore = nixpkgs.lib.nixosSystem {
        specialArgs = let
          system = systems.linux64;
          clr = clrpkgs.packages.${system};
        in {inherit inputs outputs system clr;};
        modules = [./system/hosts/terpsichore];
      };

      #banshee
      banshee = nixpkgs.lib.nixosSystem {
        specialArgs = let
          system = systems.linux64;
          clr = clrpkgs.packages.${system};
        in {inherit inputs outputs system clr;};
        modules = [./system/hosts/banshee];
      };
    };

    homeConfigurations = {
      #muse
      "clr@terpsichore" =
        home-manager.lib.homeManagerConfiguration
        {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = let
            system = systems.linux64;
            clr = clrpkgs.packages.${system};
          in {inherit inputs outputs system clr risotti;};
          modules = [./home-manager/hosts/terpsichore];
        };

      #banshee
      "clr@banshee" =
        home-manager.lib.homeManagerConfiguration
        {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = let
            system = systems.linux64;
            clr = clrpkgs.packages.${system};
          in {inherit inputs outputs system clr;};
          modules = [./home-manager/hosts/banshee];
        };
    };
  };
}
