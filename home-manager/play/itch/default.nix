{ pkgs, inputs, config,... }:
{
  home.packages = with pkgs;
  [
  itch
  ];

  home.file = { 
    ".local/share/applications/itch.desktop".source = config.lib.file.mkOutOfStoreSymlink ./itch.desktop;
  };
}
