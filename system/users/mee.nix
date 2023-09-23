{ pkgs, ... }:

{
  # User
  users.users.clr = {
    isNormalUser = true;
    description = "clr";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "docker" "video" ];
    packages = with pkgs; [ home-manager ];
  };
  programs.fish.enable = true;

}
