{ pkgs, inputs, ... }:
{
  programs.fish = {
	enable = true;



	functions = {
		fish_greeting = "";
		sht = "shutdown now";
		picoms = "picom & disown";
    itchs = "itch --no-sandbox";
	};

	interactiveShellInit = ''
		fish_add_path --append ~/.local/bin
	'';



  };
}
