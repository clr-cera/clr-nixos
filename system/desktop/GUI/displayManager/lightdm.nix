{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../addons/gnomeKeyring.nix
  ];

  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [
      xterm
    ];

    displayManager = {
      lightdm = {
        enable = true;
        greeters.slick = {
          enable = true;

          #         cursorTheme.name  = "Catpuccin-Mocha-Dark-Cursors";
          #         cursorTheme.package = pkgs.catppuccin-cursors.mochaDark;

          #          theme.name = "TokyoNight";

        };
      };
    };
  };

  #GnomeKeyring auto login
  security.pam.services.lightdm.enableGnomeKeyring = true;
}
