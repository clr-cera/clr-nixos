{ pkgs, inputs, ... }:
{
  imports = [


  ];

  home.packages = with pkgs;
  [
	steam
	lutris
  ];

}
