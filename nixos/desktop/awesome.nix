{ inputs, lib, config, pkgs, ... }:

{

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

        cursorTheme.name  = "Catpuccin-Mocha-Dark-Cursors";
        cursorTheme.package = pkgs.catppuccin-cursors.mochaDark;
        
#        theme.name = "TokyoNight";
        
#        extraConfig = 
#        ''
#        show-power=false
#        show-a11y=false
#        show-keyboard=false
#        show-clock=false 
#        background="/home/nix/.config/Wallpapers/lightdmWallpaper.jpg"
#        '';

			};	
		};

		defaultSession = "none+awesome";		
	};
	windowManager.awesome = {
		enable = true;
		luaModules = with pkgs.luaPackages; [
			luarocks
			luadbi-mysql
		];	
	};
  };
}
