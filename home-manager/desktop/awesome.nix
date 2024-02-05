{pkgs, ...}: 

{
  xsession.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [
      luarocks
      luadbi-mysql
    ];
  };
  home.packages = with pkgs; [
    picom
    arandr
    nitrogen
  ];

}
