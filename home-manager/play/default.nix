{
  pkgs,
  clr,
  ...
}: {
  imports = [
    ./steam.nix
    ./lutris.nix
    ./mine.nix
    ./genshin.nix
  ];

  home.packages = with pkgs; [
    osu-lazer-bin
    itch
    clr.pokemmo-installer
    heroic
  ];
}
