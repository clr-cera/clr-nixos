{ pkgs, inputs, config, lib, ... }:

let ext = inputs.nix-vscode-extensions.extensions;

in
{
  home.packages = with pkgs;
  [
    vscode-with-extensions.override {
      vscodeExtensions = with ext; 
      [
        beardedbear.beardedicons
        ms-vscode.cpptools
        ms-vscode.cpptools-extension-pack
        ms-vscode.cpptools-themes
        justusadam.language-haskell
        ms-toolsai.jupyter
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-slideshow
        bbenoist.nix
        arrterian.nix-env-selector
        alefragnani.project-manager
        ms-python.vscode-pylance
        ms-python.python
        mechatroner.rainbow-csv
        enkia.tokyo-night
      ];
    };
  ];
}
