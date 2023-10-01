# This is muse!
{ ... }: {
  
  systemd.user.services.monitor = {
    description = "This script sets up muse display";
    serviceConfig.PassEnvironment = "DISPLAY";
    script = ''
     xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 2560x1080 --pos 0x0 --rotate normal --output DP-2 --primary --mode 1920x1080 --pos 2560x0 --rotate normal --brightness 0.7 
    '';
    wantedBy = [ "multi-user.target" ]; # starts after login
  };
}
