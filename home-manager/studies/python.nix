{ pkgs, inputs, ... }:

let
    my-python-packages = ps: with ps; [
      pygame
      pandas
      numpy
      scikit-learn
      matplotlib
      seaborn
      plotly
      pysimplegui
    ];
  in
{
  home.packages = [
    (pkgs.python3.withPackages my-python-packages)
  ];

}