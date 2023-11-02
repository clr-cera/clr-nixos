{pkgs, ...}: {
  home.packages = with pkgs; [
    any-nix-shell
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fish = {
    enable = true;

    functions = {
      fish_greeting = "";
      sht = "shutdown now";
      picoms = "picom & disown";
      nixswitch = "cd ~/clr-nixos & sudo nixos-rebuild switch --flake .";
      homeswitch = "cd ~/clr-nixos & home-manager switch --flake . & cd & wait";
      ns = "nix-shell";
      nsp = "nix-shell --pure";
      nd = "nix develop -c fish";
      nb = "nix build .";
      muse_set_screen = "xrandr --output DP-0 --off --output DP-1 --off --output HDMI-0 --mode 2560x1080 --pos 0x0 --rotate normal --output DP-2 --primary --mode 1920x1080 --pos 2560x0 --rotate normal --brightness 0.7 & nitrogen --restore";
    };

    interactiveShellInit = ''
      export DIRENV_LOG_FORMAT=
      fish_add_path --append ~/.local/bin &
      any-nix-shell fish | source
      direnv hook fish | source
    '';
  };
}
