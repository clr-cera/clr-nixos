{ inputs, lib, config, pkgs, ... }:

{  
boot.kernelPackages = let
    linux_zen_pkg = { fetchurl, buildLinux, ... } @ args:
    buildLinux (args // rec {
        version = "5.7.8-zen2";
        modDirVersion = version;
  
        src = builtins.fetchGit {
          url = https://github.com/zen-kernel/zen-kernel.git;
          ref = "refs/tags/v${version}";
        };

        kernelPatches = [];

        extraMeta.branch = "5.7";
      } // (args.argsOverride or {}));
    linux_zen = pkgs.callPackage linux_zen_pkg {};
  in 
    pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_zen);

}
