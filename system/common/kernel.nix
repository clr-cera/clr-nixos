{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [
    "acpi_backlight=native"
  ];
}
