{ pkgs, inputs, config, lib, ... }:

let 
  ext = inputs.nix-vscode-extensions.extensions.x86_64-linux.vscode-marketplace;
  vscode-insiders = 
    (pkgs.vscode.override { isInsiders = true; }).overrideAttrs (oldAttrs: rec {
      src = (builtins.fetchTarball {
      url = "https://code.visualstudio.com/sha/download?build=insider&os=linux-x64";
      sha256 = "0lf9zv4jvpq4qlsyn82j836whss79q1qk7zk6g7zl15wfcbycp2x";
      });
      version = "latest";

      buildInputs = oldAttrs.buildInputs ++ [ pkgs.krb5 ];
    });
in
{
  home.packages = with pkgs;
  [
    (vscode-with-extensions.override {
      vscode = vscode-insiders;

      vscodeExtensions = 
      [
        ext.beardedbear.beardedicons
        ext.ms-vscode.cpptools
        ext.ms-vscode.cpptools-extension-pack
        ext.ms-vscode.cpptools-themes
        ext.justusadam.language-haskell
        ext.ms-toolsai.jupyter
        ext.ms-toolsai.vscode-jupyter-cell-tags
        ext.ms-toolsai.jupyter-keymap
        ext.ms-toolsai.jupyter-renderers
        ext.ms-toolsai.vscode-jupyter-slideshow
        ext.bbenoist.nix
        ext.arrterian.nix-env-selector
        ext.alefragnani.project-manager
        ext.ms-python.vscode-pylance
        ext.ms-python.python
        ext.mechatroner.rainbow-csv
        ext.enkia.tokyo-night
      ];
    })
  ];
}
