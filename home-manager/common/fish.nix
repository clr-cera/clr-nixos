{ pkgs, inputs, ... }:
{
  programs.fish = {
	enable = true;



	functions = {
		fish_greeting = "";
		sht = "shutdown now";
		picoms = "picom & disown";




	};


  };
}
