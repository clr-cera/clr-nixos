{ pkgs, ... }:
{
  imports = [
    ./python.nix
    ./c.nix
    ./lvim
    ./nvim.nix
  ];

  home.packages = with pkgs;
  [
  gh
  lazygit
  notion-app-enhanced
  vscode
  ];
}
