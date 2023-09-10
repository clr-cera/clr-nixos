{ inputs, ... }:
{
  home.packages =
  [
    inputs.ICMChat.packages.x86_64-linux.default 
  ];
}
