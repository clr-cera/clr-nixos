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
    #awesome 
    ".config/awesome/".source = config.lib.file.mkOutOfStoreSymlink ./files/awesome;
    
    #picom
    ".config/picom/".source = config.lib.file.mkOutOfStoreSymlink ./files/picom;

    #eww
    ".config/eww/".source = config.lib.file.mkOutOfStoreSymlink ./files/eww;

    #peaclock
    ".peaclock/".source = config.lib.file.mkOutOfStoreSymlink ./files/peaclock;
    
    #kitty
    ".config/kitty/".source = config.lib.file.mkOutOfStoreSymlink ./files/kitty;





  };



}
