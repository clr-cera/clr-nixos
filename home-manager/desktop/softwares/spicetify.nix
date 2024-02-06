{
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  imports = [
    inputs.spicetify-nix.homeManagerModule
  ];

  #Spicetify
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Default;
    colorScheme = "custom";

    customColorScheme = {
      button = "e0af68";
      sidebar = "1a1b26";
      player = "1a1b26";
      main = "1a1b26";
      button-active = "e0af68";
      text = "c0caf5";
      subtext = "9aa5ce";
      button-text = "c0caf5";
      card = "1a1b26";
      shadow = "1a1b26";
      selected-row = "c0caf5";
      sub-button = "e0af68";
      button-disabled = "e0af68";
      sidebar-button = "8c4351";
      play-button = "e0af68";
      tab-active = "e0af68";
      notification = "e0af68";
      notification-error = "e0af68";
      playback-bar = "e0af68";
      misc = "e0af68";
    };

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
    ];
  };
}
