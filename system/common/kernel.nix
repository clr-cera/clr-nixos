{config, pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [
    "acpi_backlight=native"
  ];

  # For obs virtual cam
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;
}
