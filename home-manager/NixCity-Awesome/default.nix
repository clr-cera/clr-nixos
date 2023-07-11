{ pkgs, inputs, config,... }:

{
  imports = [
    ./spicetify.nix
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
	betterdiscordctl
	cava
	peaclock
	arandr
	nitrogen
	neofetch
	hyfetch
	zathura
  lxappearance

	(pkgs.nerdfonts.override { fonts = 
	[ 
	"FiraCode"  
	"RobotoMono"
	]
	;})
	sarasa-gothic



  ];
  
  #cursor
  home.pointerCursor = {

      name = "Catppuccin-Mocha-Dark-Cursors";

      package = pkgs.catppuccin-cursors.mochaDark;

      size = 16;
    };  

  home.file = {
    #awesome 
    ".config/awesome/".source = config.lib.file.mkOutOfStoreSymlink ./files/awesome;
    
    #picom
    ".config/picom/".source = config.lib.file.mkOutOfStoreSymlink ./files/picom;

    #eww
    ".config/eww/".source = config.lib.file.mkOutOfStoreSymlink ./files/eww;

    #peaclock
    ".peaclock/config".source = config.lib.file.mkOutOfStoreSymlink ./files/peaclock/config;
    
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
    
    #betterdiscord
    ".config/BetterDiscord/themes/neo-tokyo-night.theme.css".source = config.lib.file.mkOutOfStoreSymlink ./files/BetterDiscord/themes/neo-tokyo-night.theme.css;
    
    #GTK theme
    ".local/share/themes/TokyoNight".source = config.lib.file.mkOutOfStoreSymlink ./files/TokyoNight-GTK;
    
    #GTK icons
    ".local/share/icons/candy-icons".source = config.lib.file.mkOutOfStoreSymlink ./files/candy-icons-master;



  };



}
