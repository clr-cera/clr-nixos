{pkgs, inputs, ...}: {
  

  programs.wofi.enable = true;
  
  home.packages = with pkgs; [
    inputs.hyprsome.packages.${system}.default
    mako
    swww
    waybar
    waypaper
    swaylock
  ];
}
