{ pkgs, inputs, config,... }:
{
  imports = [
  ];


  fonts.fontconfig.enable = true;


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
	zathura

	(pkgs.nerdfonts.override { fonts = 
	[ 
	"FiraCode"  
	"RobotoMono"
	]
	;})
	sarasa-gothic



  ];

  home.file = {
    ".config/awesome/rc.lua".source = config.lib.file.mkOutOfStoreSymlink ./files/rc.lua;
    ".config/awesome/clrawesome.lua".source = config.lib.file.mkOutOfStoreSymlink ./files/clrawesome.lua;
    ".peaclock/config".source = config.lib.file.mkOutOfStoreSymlink ./files/peaclockConfig;




  };



}
