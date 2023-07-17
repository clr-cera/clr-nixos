{ pkgs, inputs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
    
    
    
    ];
  };
}
