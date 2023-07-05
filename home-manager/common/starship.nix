{ pkgs, inputs, ... }:
{
  programs.starship = {
	enable = true;
	enableFishIntegration = true;
  };
}
