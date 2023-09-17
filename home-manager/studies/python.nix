{ pkgs, ... }:

let
    my-python-packages = ps: with ps; [ 
      #trivia
      pygame

      #kaggle
      kaggle

      #jupyter
      jupyter-core
      notebook

      #data 
      pandas
      numpy
      scikit-learn
      matplotlib
      seaborn
      plotly

      # GUI
      pysimplegui

      #autopoiesis
      (#SpeechRecognition
        buildPythonPackage rec {
          pname = "SpeechRecognition";
          version = "3.10.0";
          src = fetchPypi {
            inherit pname version;
            sha256 = "sha256-FBMRVeiougDq0be5saL6cchF5Ntfml9mozob1sVcbDU=";
          };
          doCheck = false;
          propagatedBuildInputs = [
            pkgs.python3Packages.requests
          ];
        }
      )
      pyttsx3
      pyaudio

      #Networking
      dnspython

      #TurtleSnake
      keyboard

    ];
  in
{
  home.packages = [
    (pkgs.python3.withPackages my-python-packages)
    pkgs.arcanPackages.espeak
    pkgs.flac
    pkgs.python311Packages.cython_3
  ];

}
