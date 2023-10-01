{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  home.file = {
    ".config/lvim/config.lua".source = config.lib.file.mkOutOfStoreSymlink ./config.lua;
  };
}
