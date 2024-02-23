{inputs, system, ...}:

{
  home.packages = [ inputs.aagl.packages.${system}.anime-game-launcher ];
}
