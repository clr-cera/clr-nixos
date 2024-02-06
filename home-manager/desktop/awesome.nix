{pkgs, ...}: 

{
  home.packages = with pkgs; [
    picom
    arandr
    nitrogen
  ];

}
