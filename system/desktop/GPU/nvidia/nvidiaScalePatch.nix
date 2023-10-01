{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  #Trying to fix overscale
  services.xserver.dpi = 144;
  environment.variables = rec {
    GDK_SCALE = "0.67";
    GDK_DPI_SCALE = "0.67";
  };
}
