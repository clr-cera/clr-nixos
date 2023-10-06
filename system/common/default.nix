{pkgs, ...}: {
  imports = [
    ./language.nix
    ./nix.nix
    ./kernel.nix
    ./network.nix
    ./tailscale.nix
  ];
  environment.systemPackages = with pkgs; [alejandra];
}
