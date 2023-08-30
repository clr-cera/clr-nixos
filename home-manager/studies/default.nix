{ pkgs, inputs, config, lib, ... }:
{
  imports = [
    ./python.nix
    ./c.nix
    ./lvim
  ];

  home.packages = with pkgs;
  [
  gh
  lazygit
  notion-app-enhanced
  vscode
  ];

  programs.neovim ={
    enable = true;

    viAlias = true;
    vimAlias = true;
  };
}
