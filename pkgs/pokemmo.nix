{ stdenv
, lib
, fetchzip
, jdk17
, makeWrapper
, makeDesktopItem
, copyDesktopItems
, imagemagick
, ed
}:

stdenv.mkDerivation rec {
  pname = "pokemmo";
  version = "24499";

  src = fetchzip {
    url = "https://dl.pokemmo.com/PokeMMO-Client.zip";
    sha256 = "sha256-OkRpDPOgFKKpZO/8K7qA3WiLN7nbV0UbV+EMUBMWA70";
    stripRoot=false;
  };

  buildInputs = [
    jdk17
    imagemagick
    makeWrapper
    ed
    copyDesktopItems
  ];

  desktopItems = [
    (makeDesktopItem {
      name = pname;
      desktopName = "PokeMMO";
      exec = pname;
      comment = meta.description;
      icon = pname;
      categories = [ "Game" ];
    })
  ];

  buildPhase = ''
  touch executionScript.sh
  chmod +x executionScript.sh
  echo "cd $out/share/${pname}
  exec ./PokeMMO.sh" >> executionScript.sh
  '';

  installPhase = ''
    mkdir -p $out/{bin,share/${pname}}
    cp -r . "$out/share/${pname}"
    ln -s $out/share/${pname}/executionScript.sh $out/bin/pokemmo 
   
    #Copy the desktop item into $out
    copyDesktopItems

    # Generate and install icon files
    mkdir -p $out/share/icons/hicolor/128x128/apps
    cp $out/share/pokemmo/data/icons/128x128.png $out/share/icons/hicolor/128x128/apps/${pname}.png 
  '';

    postFixup = ''
    wrapProgram $out/bin/pokemmo --prefix PATH : ${lib.makeBinPath [ jdk17 ]}
  '';

  meta = with lib; {
    homepage = "https://pokemmo.eu";
    description = "MMO based on the Pokémon Universe";
    license = "Custom";
    platforms = platforms.linux;
  };
}
