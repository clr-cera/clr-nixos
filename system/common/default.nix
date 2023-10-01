{pkgs, ...}: {
  imports = [
    ./language.nix
    ./nix.nix
    ./kernel.nix
    ./network.nix
  ];
  environment.systemPackages = with pkgs; [alejandra];
}
