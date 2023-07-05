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
  ];

  i18n.inputMethod.enabled = "fcitx5";

}
