{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix

    ./../../modules/common.nix
    ./../../modules/users.nix
    ./../../modules/ddclient.nix
  ];

  # Booting
  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "udev.log_level=3" ];
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
    timeout = 0;
  };

  networking.hostName = "rhodo";

  # Headless nvidia support
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = true; # For never cards
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.flatpak.enable = true;
  programs.zsh.enable = true;

  users.defaultUserShell = pkgs.zsh;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 3000 8080 11434 5000 80 ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
