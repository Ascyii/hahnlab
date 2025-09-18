{ config, pkgs, ... }:

{
  imports = [ 
    ./../../modules/common.nix
    ./../../modules/users.nix
  ];

  networking.hostName = "gullfoss";
}
