{ pkgs, inputs, ... }:
{
  imports = [

  ];

  home.packages = with pkgs;
  [
  discord
  vivaldi
  github-desktop
  gimp-with-plugins
  xfce.thunar
  xfce.thunar-volman
  telegram-desktop
  whatsapp-for-linux
  vscode
  pavucontrol
  javaPackages.openjfx19
  ];


  services.flameshot.enable = true;

  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [ fcitx5-rime fcitx5-chinese-addons ];
  
}
