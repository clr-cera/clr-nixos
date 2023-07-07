{ pkgs, inputs, ... }:
{
  imports = [

  ];

  home.packages = with pkgs;
  [
  spotify
  discord
  vivaldi
  github-desktop
  gimp-with-plugins
  xfce.thunar
  xfce.thunar-volman
  telegram-desktop
  vscodium
  pavucontrol
  ];


  services.flameshot.enable = true;

  i18n.inputMethod.enabled = "fcitx5";
  
}
