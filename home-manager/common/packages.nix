{ pkgs, inputs, ... }:
{
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
