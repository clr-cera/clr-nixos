{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    qbittorrent
    ani-cli
  ];
}
