{
  description = "HahnLab NixOS main flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Setup sops for the ddclient secrets
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, disko, sops-nix, ... }@inputs:
    let
      system = "x86_64-linux";

      # Generic helper
      mkHost = name: {
        nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/${name}/configuration.nix
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
        ];
      }};
    in {
      nixosConfigurations = {
        gullfoss = mkHost "gullfoss";
        rhodo    = mkHost "rhodo";
      };
    };
}
