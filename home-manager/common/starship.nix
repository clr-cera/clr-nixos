{
  pkgs,
  inputs,
  ...
}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      format = ''
        $time$username$hostname
        $localip$shlvl$singularity$kubernetes$directory$vcsh$fossil_branch$git_branch$git_commit$git_state$git_metrics$git_status$hg_branch$pijul_channel$docker_context$package$c$cmake$cobol$daml$dart$deno$dotnet$elixir$elm$erlang$fennel$golang$guix_shell$haskell$haxe$helm$java$julia$kotlin$gradle$lua$nim$nodejs$ocaml$opa$perl$php$pulumi$purescript$python$raku$rlang$red$ruby$rust$scala$swift$terraform$vlang$vagrant$zig$buf$nix_shell$conda$meson$spack$memory_usage$aws$gcloud$openstack$azure$env_var$crystal$custom$sudo$cmd_duration
        $jobs$battery$status$os$container$shell$character
      '';

      add_newline = false;

      palette = "clr_palette";

      palettes.clr_palette = {
        symbol_color = "#bb9af7";
        orange = "#e0af68";
      };

      character = {
        success_symbol = "[](symbol_color)";
        error_symbol = "[](symbol_color)";
      };

      time = {
        disabled = false;
        format = "[\\[ $time \\]]($style) ";
        time_format = "%T";
        style = "bold orange";
      };

      directory = {
        home_symbol = " ";
      };

      username = {
        style_user = "orange bold";
        style_root = "orange bold";
        format = "[$user]($style) ";
        show_always = true;
      };

      nix_shell = {
        impure_msg = "";
        format = "via [$symbol(\($name\))]($style) ";
      };
    };
  };
}
