{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    lutris
    winetricks
];

}
