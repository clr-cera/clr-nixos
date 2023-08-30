{ pkgs, inputs, config, lib, ... }:
{
  imports = [
    ./python.nix
    ./c.nix
    ./lvim
    ./vscode.nix
  ];

  home.packages = with pkgs;
  [
  gh
  lazygit
  notion-app-enhanced
  ];

  programs.neovim ={
    enable = true;

    viAlias = true;
    vimAlias = true;
  };
}
