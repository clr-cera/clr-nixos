{
  inputs,
  system,
  ...
}: {
  imports = [
    ./language.nix
    ./nix.nix
    ./kernel.nix
  ];
  environment.systemPackages = [inputs.alejandra.defaultPackage.${system}];
}
