{ inputs, lib, config, pkgs, ... }:

{
  # User
  users.users.clr = {
    isNormalUser = true;
    description = "clr";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ pkgs.home-manager ];
  };
  programs.fish.enable = true;

}
