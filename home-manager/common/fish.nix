{ pkgs, inputs, config, ... }:

{
  programs.fish = {
	enable = true;

	functions = {
		fish_greeting = "";
		sht = "shutdown now";
		picoms = "picom & disown";
    nixswitch = "cd ~/clr-nixos & sudo nixos-rebuild switch --flake .";
    homeswitch = "cd ~/clr-nixos & home-manager switch --flake . & cd & wait";
	};

	interactiveShellInit = ''
		fish_add_path --append ~/.local/bin
	'';

  };
}
