{pkgs, ...}: {

  systemd.user.services.fcitx = {
    description = "fcitx startup!";
    path = with pkgs; [ fcitx5 ];
    serviceConfig.PassEnvironment = "DISPLAY";
    script = ''
      fcitx5
    '';
    wantedBy = [ "multi-user.target" ]; # starts after login
  };
}
