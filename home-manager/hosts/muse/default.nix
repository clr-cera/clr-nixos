{ inputs, lib, config, pkgs, ... }: {

  imports = [

    # GUI Customization
    ../../CottonCandy-Awesome
    
    ../../desktop
    ../../desktop/torrent.nix

    ../../common

    ../../studies
    
    ../../play

    # Provisory
    ../../server

    # Optional
#    ../../optional/ICMChat.nix
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
