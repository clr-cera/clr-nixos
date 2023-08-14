{ inputs, lib, config, pkgs, ... }:

{
  # User
  users.users.nix = {
    isNormalUser = true;
    description = "nix";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ pkgs.home-manager ];
  };

  programs.fish.enable = true;

}
