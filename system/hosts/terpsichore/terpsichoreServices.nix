# This is muse!
{...}: {
  services.xserver.displayManager.sessionCommands = ''
    xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 2560x1080 --pos 0x0 --rotate normal --output DP-2 --primary --mode 1920x1080 --pos 2560x0 --rotate normal --brightness 0.7
  '';
}
