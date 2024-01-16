{
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

    displayManager.gdm.enable = true;
  };
  
  nixpkgs = {
    overlays = [
      (self: super: {
        gnome = super.gnome.overrideScope' (selfg: superg: {
          gnome-shell = superg.gnome-shell.overrideAttrs (old: {
            patches = (old.patches or []) ++ [
              (let
                bg = ./wallpaper/display-manager-wallpaper.jpg;
              in pkgs.writeText "bg.patch" ''
                --- a/data/theme/gnome-shell-sass/widgets/_login-lock.scss
                +++ b/data/theme/gnome-shell-sass/widgets/_login-lock.scss
                @@ -15,4 +15,5 @@ $_gdm_dialog_width: 23em;
                 /* Login Dialog */
                 .login-dialog {
                   background-color: $_gdm_bg;
                +  background-image: url('file://${bg}');
                 }
              '')
            ];
          });
        });
      })
    ];
  };

  #GnomeKeyring auto login
  security.pam.services.gdm.enableGnomeKeyring = true;
}
