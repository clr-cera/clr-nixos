{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "My configuration install shell";
  
  NIX_CONFIG = "experimental-features = nix-command flakes";
  nativeBuildInputs = with pkgs.buildPackages; [
    git home-manager
  ]; 
}
