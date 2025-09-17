{ config, pkgs, ... }:

{
  imports = [ 
    ./disko.nix
    ./../../modules/common.nix
    ./../../modules/users.nix
  ];

  networking.hostName = "gullfoss";
}
