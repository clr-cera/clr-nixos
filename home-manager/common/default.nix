{ pkgs, inputs, ... }:
{
  imports = [


  ];

  home.packages = with pkgs;
  [
	zip
	unzip
	ranger
  ];

}
