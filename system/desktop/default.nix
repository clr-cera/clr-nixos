{pkgs, ...}: {
  imports = [
    ./bluetooth.nix
    ./sound.nix
    ./services.nix
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "*";
  };

  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    acpilight
    brightnessctl
  ];
}
