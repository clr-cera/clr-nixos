{ inputs, outputs, ... }:

{
  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
        permittedInsecurePackages = [
          "openssl-1.1.1u"
          "electron-11.5.0"
        ];
	  };
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      inputs.clrpkgs.overlays.modifications
    ];
  };
}
