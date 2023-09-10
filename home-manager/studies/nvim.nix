{ pkgs, inputs, config, lib, ... }:
{
  programs.neovim ={
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      plenary-nvim
      tokyonight-nvim
      mini-nvim
      neo-tree-nvim
    ];
  };
}
