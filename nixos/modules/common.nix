{ pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 ];
  };

  services.openssh.enable = true;

  security.sudo.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Berlin";
  #i18n.defaultLocale = "en_US.UTF-8";

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    htop
    curl
    wget
    docker-compose
    lazygit
    yazi
    tmux
    python3
  ];
}
