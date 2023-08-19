{ pkgs, inputs, config, lib, ... }:
{
  imports = [
  ];

  home.packages = with pkgs;
  [
    noip
  ];
}
