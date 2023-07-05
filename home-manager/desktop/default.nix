{ pkgs, inputs, ... }:
{
  imports = [

  ];

  home.packages = with pkgs;
  [
  	spotify
	discord
	vivaldi
	github-desktop
  ];

}
