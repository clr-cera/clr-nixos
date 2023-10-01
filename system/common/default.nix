{pkgs, ...}: {
  imports = [
    ./language.nix
    ./nix.nix
    ./kernel.nix
  ];
  environment.systemPackages = with pkgs; [alejandra];
}
