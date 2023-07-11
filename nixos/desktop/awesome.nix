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
