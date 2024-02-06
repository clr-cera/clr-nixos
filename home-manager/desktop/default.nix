{pkgs, ...}: {
  imports = [
  ./environment.nix
  ./softwares/spicetify.nix
  ];

  home.packages = with pkgs; [
    discord
    vivaldi
    github-desktop
    gimp-with-plugins
    telegram-desktop
    whatsapp-for-linux
    pavucontrol
    feh
    vlc
    audacious
  ];

  services.flameshot.enable = true;

  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [fcitx5-rime fcitx5-chinese-addons];
}
