{ pkgs, ... }: {
  home.packages = with pkgs; [
    prismlauncher
    jdk
  ];
}
