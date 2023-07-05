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
    ".config/awesome/rc.lua".source = config.lib.file.mkOutOfStoreSymlink ./files/awesome/rc.lua;
    ".config/awesome/clrawesome.lua".source = config.lib.file.mkOutOfStoreSymlink ./files/awesome/clrawesome.lua;
    
    #peaclock
    ".peaclock/config".source = config.lib.file.mkOutOfStoreSymlink ./files/peaclock/peaclockConfig;
    
    #kitty
    ".config/kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink ./files/kitty/kitty.conf;
    ".config/kitty/current-theme.conf".source = config.lib.file.mkOutOfStoreSymlink ./files/kitty/current-theme.conf;




  };



}
