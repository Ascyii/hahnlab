{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Setup sops for the ddclient secrets
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, disko, sops-nix, ... }@inputs: {
    nixosConfigurations = {
      gullfoss = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/gullfoss/configuration.nix
          disko.nixosModules.disko
        ];
      };
      rhodo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/rhodo/configuration.nix
          disko.nixosModules.disko
        ];
      };
    };
  };
}
