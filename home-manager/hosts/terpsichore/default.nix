{risotti, inputs, system, pkgs, ...}: {
  imports = [
    # GUI Customization
    ../../desktop
    ../../desktop/softwares/torrent.nix
    ../../desktop/hyprland.nix
    ../../desktop/awesome.nix

    ../../common

    ../../studies

    ../../play
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
