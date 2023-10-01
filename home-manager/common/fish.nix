{
  pkgs,
  inputs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    any-nix-shell
  ];

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
    };

    interactiveShellInit = ''
      fish_add_path --append ~/.local/bin &
        any-nix-shell fish | source
    '';
  };
}
