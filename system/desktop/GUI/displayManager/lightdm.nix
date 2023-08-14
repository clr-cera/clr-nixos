{ inputs, lib, config, pkgs, ... }:

{
  imports =
    [ 
      ../addons/gnomeKeyring.nix
    ];

  services.xserver = {
	  enable = true;
	  excludePackages = with pkgs; [
		  xterm
	  ];

	  displayManager = {
		  lightdm = {
			  enable = true;
			  greeters.slick ={
				  enable = true;

#         cursorTheme.name  = "Catpuccin-Mocha-Dark-Cursors";
#         cursorTheme.package = pkgs.catppuccin-cursors.mochaDark;
        
#          theme.name = "TokyoNight";
        
         extraConfig = 
         ''
         show-power=false
         show-a11y=false
         show-keyboard=false
         show-clock=false 
         background="/home/nix/.config/Wallpapers/lightdmWallpaper.jpg"
         '';

			  };	
		  };
	  };
  };

  #GnomeKeyring auto login
  security.pam.services.lightdm.enableGnomeKeyring = true;
}
