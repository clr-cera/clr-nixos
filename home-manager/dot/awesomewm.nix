{ pkgs, inputs, ... }:

{
  xsession.windowManager.awesome = {
	enable = true;
	luaModules = with pkgs.luaPackages; [
		luarocks
		luadbi-mysql
	];
  };

};
