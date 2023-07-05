{ pkgs, inputs, ... }:
{
  imports = [
  ];

  home.packages = with pkgs;
  [
	kitty
	picom
	rofi
	eww
	btop
	ranger
	betterdiscord-installer
	cava
	peaclock
	arandr
	nitrogen
	neofetch
	hyfetch
  ];

}
