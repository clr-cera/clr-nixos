{ pkgs, inputs, ... }:
{
  imports = [
    ./fish.nix
    ./starship.nix
    ./packages.nix
    ./nix.nix
  ];

  home = {
    username = "clr";
    homeDirectory = "/home/nix";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
