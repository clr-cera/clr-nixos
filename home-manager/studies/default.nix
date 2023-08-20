{ pkgs, inputs, config, lib, ... }:
{
  imports = [
    ./python.nix
    ./c.nix
    ./haskell.nix
    ./lvim
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
