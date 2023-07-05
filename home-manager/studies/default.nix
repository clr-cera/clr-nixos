{ pkgs, inputs, ... }:
{
  imports = [


  ];

  home.packages = with pkgs;
  [
	libgccjit
	gh
	neovim
  ];

}
