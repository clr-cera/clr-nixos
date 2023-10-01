{rices, ...}: {
  imports = [
    # GUI Customization
    rices.nixCandy

    ../../desktop
    ../../desktop/torrent.nix

    ../../common

    ../../studies

    ../../play
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
