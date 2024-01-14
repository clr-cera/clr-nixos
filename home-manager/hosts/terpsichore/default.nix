{risotti, inputs, system, pkgs, ...}: {
  imports = [
    # GUI Customization
    risotti.nixCandy

    ../../desktop
    ../../desktop/torrent.nix

    ../../common

    ../../studies

    ../../play
  ];

  # hyprland tinkering
  programs.wofi.enable = true;
  home.packages = with pkgs; [
    inputs.hyprsome.packages.${system}.default
    mako
    swww
  ];


  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
