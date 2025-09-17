{ pkgs }:

{
  imports = [ 
    ./disko.nix
    ./../../modules/common.nix
    ./../../modules/users.nix
    ./../../modules/ddclient.nix
  ];

  # Booting
  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "udev.log_level=3" ];
  boot.loader =  {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
    timeout = 0;
  };

  networking.hostName = "rhodo";
}
