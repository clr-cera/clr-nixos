{ pkgs, inputs, ... }:
{
  home.packages =
  [
  inputs.ICMChat.packages.default
  ];
}
