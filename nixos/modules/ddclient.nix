{ config, ... }:

{
  services.ddclient = {
    enable = false;
    protocol = "dyndns2";
    use = "web, web=api.ipify.org";
    server = "dyndns.strato.com/nic/update";
    login = "bitzz.de";
    password = "${config.sops.placeholder.strato-dns-password}";
    domains = [ "bitzz.de" ];
  };
}
