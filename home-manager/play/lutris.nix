{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    lutris
    wineWowPackages.full
    winetricks

    pciutils
    psmisc
    glxinfo
    vulkan-tools
    xboxdrv
    pulseaudio
    xorg.xgamma
    libstrangle
    fluidsynth
    xorg.xorgserver
    xorg.setxkbmap
    xorg.xkbcomp
    # bypass mount suid wrapper which does not work in fhsenv
    util-linux
    jansson
  ];
}
