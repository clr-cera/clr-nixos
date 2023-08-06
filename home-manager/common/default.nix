{ pkgs, inputs, ... }:
{
  imports = [
    ./fish.nix
    ./starship.nix
  ];

  home.packages = with pkgs;
  [
  p7zip
	zip
	unzip
  unrar
  ranger
	gnumake
	xclip
	binutils
  lshw
  acpi
  ];




}
