{
  inputs,
  lib,
  config,
  outputs,
  pkgs,
  ...
}: {
  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "openssl-1.1.1u"
      ];
      allowUnfree = true;
    };

    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      
      inputs.clrpkgs.overlays.modifications
      
    ];
  };

  # Settings
  nix = {
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
  };
}
