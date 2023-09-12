{ stdenv
, lib
, fetchzip
, jdk17
, makeDesktopItem
, imagemagick
}:

stdenv.mkDerivation rec {
  pname = "pokemmo";
  version = "0.1.0";

  src = fetchzip {
    url = "https://dl.pokemmo.com/PokeMMO-Client.zip";
    sha256 = "sha256-OkRpDPOgFKKpZO/8K7qA3WiLN7nbV0UbV+EMUBMWA70";
    stripRoot=false;
  };

  buildInputs = [
    jdk17
    imagemagick
  ];

  desktopItems = [
    (makeDesktopItem {
      name = "PokeMMO";
      desktopName = "PokeMMO";
      exec = "PokeMMO";
      comment = meta.description;
      icon = "pokemmo";
      categories = [ "Game" ];
    })
  ];


  configurePhase = ''

  '';

  buildPhase = ''

  '';

  installPhase = ''
    mkdir -p $out/{bin,share/${pname}}
    cp -r . "$out/share/${pname}"
    ln -s $out/share/${pname}/PokeMMO.sh $out/bin/PokeMMO.sh

    # Generate and install icon files
    for size in 16 32 48 64 72 96 128; do
      mkdir -p $out/share/icons/hicolor/"$size"x"$size"/apps
      convert $out/share/pokemmo/data/icons/128x128.png -sample "$size"x"$size" \
        -gravity south -extent "$size"x"$size" \
        $out/share/icons/hicolor/"$size"x"$size"/apps/pokemmo.png
    done
  '';

  meta = with lib; {
    homepage = "https://pokemmo.eu";
    description = "MMO based on the Pokémon Universe";
    license = "Custom";
    platforms = platforms.linux;
  };
}
