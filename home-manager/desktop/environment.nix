{pkgs, inputs, ...}: {
  
  home.packages = with pkgs; [
    # Environment
    kitty
    rofi-wayland
    eww-wayland
    alsa-utils
    btop
    ranger
    betterdiscordctl
    cava
    peaclock
    neofetch
    hyfetch
    zathura
    lxappearance
    inputs.clrpkgs.packages.${system}.candy-icons
    inputs.clrpkgs.packages.${system}.tokyo-night-gtk-stronk
   
    # Fonts
    (pkgs.nerdfonts.override {fonts = [
      "FiraCode"
      "RobotoMono"
    ];})
    sarasa-gothic
    inter

  ];
  fonts.fontconfig.enable = true;

  #cursor
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Dark-Cursors";

    package = pkgs.catppuccin-cursors.mochaDark;

    size = 16;
  };

}
