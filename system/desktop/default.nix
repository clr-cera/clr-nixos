{ inputs, lib, config, pkgs, ... }:

{
  imports =
    [ 
     ./bluetooth.nix
     ./sound.nix
    ];

  xdg.portal = { enable = true; extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; };
}
