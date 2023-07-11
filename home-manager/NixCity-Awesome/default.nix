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
    ".config/ranger/colorschemes/nixranger.py".source = config.lib.file.mkOutOfStoreSymlink ./files/ranger/colorschemes/nixranger.py;
    ".config/ranger/plugins/ranger_devicons".source = config.lib.file.mkOutOfStoreSymlink ./files/ranger/plugins/ranger_devicons;    
    ".config/ranger/rc.conf".source = config.lib.file.mkOutOfStoreSymlink ./files/ranger/rc.conf;
    ".config/ranger/scope.sh".source = config.lib.file.mkOutOfStoreSymlink ./files/ranger/scope.sh;
    ".config/ranger/rifle.conf".source = config.lib.file.mkOutOfStoreSymlink ./files/ranger/rifle.conf;
    ".config/ranger/commands.py".source = config.lib.file.mkOutOfStoreSymlink ./files/ranger/commands.py;
    ".config/ranger/commands_full.py".source = config.lib.file.mkOutOfStoreSymlink ./files/ranger/commands_full.py;

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