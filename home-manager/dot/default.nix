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

    #ranger
    ".config/ranger/".source = config.lib.file.mkOutOfStoreSymlink ./files/ranger;
    
    #btop
    ".config/btop/".source = config.lib.file.mkOutOfStoreSymlink ./files/btop;

    #cava
    ".config/cava/".source = config.lib.file.mkOutOfStoreSymlink ./files/cava;

    #neofetch
    ".config/neofetch/".source = config.lib.file.mkOutOfStoreSymlink ./files/neofetch;

    #rofi
    ".config/rofi/".source = config.lib.file.mkOutOfStoreSymlink ./files/rofi;

    #zathura
    ".config/zathura/".source = config.lib.file.mkOutOfStoreSymlink ./files/zathura;
  

    



  };



}
