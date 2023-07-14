{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    lutris
    wineWowPackages.full
    winetricks
];

}
