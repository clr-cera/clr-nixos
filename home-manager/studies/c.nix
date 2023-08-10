{ pkgs, inputs, config, lib, ... }:
{


  home.packages = with pkgs;
  [
	gcc
  clang-tools
  ];
}
