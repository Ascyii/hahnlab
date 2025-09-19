{
  description = "HahnLab NixOS main flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    disko.url = "github:nix-community/disko/latest";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = { self, nixpkgs, disko, sops-nix, ... }:
    let
      system = "x86_64-linux";
      mkHost = name:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/${name}/configuration.nix
            disko.nixosModules.disko
            sops-nix.nixosModules.sops
          ];
        };
    in {
      nixosConfigurations = {
        gullfoss = mkHost "gullfoss";
        rhodo = mkHost "rhodo";
      };
    };
}
