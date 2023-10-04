{pkgs, ...}: {
  # User
  users.users.clr = {
    isNormalUser = true;
    description = "clr";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel" "docker" "video"];
    packages = with pkgs; [home-manager];
    openssh.authorizedKeys.keys = [
	"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDK7hWcNFd+p21Xxt657irWmzX6GU5J7rJ5nenxvUhYtdLaTthnfSbhF0j03o8BpFcFTpMefo3u4YOy84JEJaL96WoeFLxOu6tuY0pym5zGGwgl2stijErzrC0I/HdqeOvHJW1sZqd7Ih60b0z/UGSnjOnxzYiU7Z7A9gNR0oiSCuAr3y/jkNj2pBuAxL1j/fbSRcYLOSPG7AauCvN59FIhO0FeChMMpA+vFPvf08nwCeJOKzQ99xKoTQ5svjIAJwdNWuwqi4Pwva4ZNuQEaBTCOTUhBLxK/xI2JKqiI+vYnRo4AquF9DzTUOGAylLoQ2mzD6ggmQ/cCo7MQRhht/C0BqyYdWOoNEOdysrjTFPF/Q8J9sk6bXs7b0zanWbBHT+Ehc6wqyh/UmNAC7wBBiCtHKSvdQoCs6KFCjWvItHQfRUcAqIbeBoMkuvH/k/EgIiVPLn6Ep+MH2TjXOgsLzI9l3c4w6aMPqwezyjnBNVYWUjVRnpmifrwQcPIkT3dc2k= clr
"
    ];
  };
  programs.fish.enable = true;
}
