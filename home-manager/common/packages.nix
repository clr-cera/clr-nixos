{ pkgs, ... }:
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
  wget
  lshw
  acpi
  nix-index
  ];
}
