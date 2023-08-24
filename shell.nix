{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # nativeBuildInputs is usually what you want -- tools you need to run
  NIX_CONFIG = "experimental-features = nix-command flakes" 
  nativeBuildInputs = with pkgs.buildPackages; [
    git home-manager
  ]; 
}
