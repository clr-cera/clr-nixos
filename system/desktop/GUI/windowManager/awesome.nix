{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [
      xterm
    ];

    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
        luadbi-mysql
      ];
    };
  };
}
