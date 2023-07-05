{ pkgs, inputs, ... }:
{
  imports = [
    ./kitty.nix

  ];

  home.packages = with pkgs;
  [
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
