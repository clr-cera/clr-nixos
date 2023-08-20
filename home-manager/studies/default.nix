{ pkgs, inputs, config, lib, ... }:
{
  imports = [
    ./python.nix
    ./c.nix
    ./haskell.nix
  ];

  home.packages = with pkgs;
  [
  gh
  lazygit
  vscode
  notion-app-enhanced
  ];

  programs.neovim ={
    enable = true;

    viAlias = true;
    vimAlias = true;
  };
}
