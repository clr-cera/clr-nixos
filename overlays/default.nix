{inputs, ...}: {
  additions = final: _prev: import ../pkgs {pkgs = final;};

  modifications = final: prev: let pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux; in {
  };
}
