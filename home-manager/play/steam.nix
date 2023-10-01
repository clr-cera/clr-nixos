{
  pkgs,
  inputs,
  ...
}: let
  steam-with-pkgs = pkgs.steam.override {
    extraPkgs = pkgs:
      with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
  };
in {
  home.packages = with pkgs; [
    steam-with-pkgs
    gamescope
    protontricks
  ];

  home.sessionVariables = {
    STEAM_FRAME_FORCE_CLOSE = "0";
  };
}
