{pkgs, ...}: {
  imports = [
    ./c.nix
    ./rust.nix
    ./lvim
    ./nvim.nix
  ];

  home.packages = with pkgs; [
    gh
    lazygit
    notion-app-enhanced
    vscode
    conda
  ];
}
