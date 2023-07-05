{ pkgs, inputs, ... }:
{
  imports = [


  ];

  home.packages = with pkgs;
  [
  	spotify
	discord
	cava
	peaclock	
	vivaldi
	github-desktop
  ];

}
