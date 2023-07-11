{ pkgs, inputs, ... }:

{

  home.packages = with pkgs; [
    python3
  ];

  let
    my-python-packages = ps: with ps; [
      pygame
      pandas
      numpy
      scikit-learn
      matplotlib
      seaborn
      plotly-express
    ];
  in
  home.packages = [
    (pkgs.python3.withPackages my-python-packages)
  ];

}
