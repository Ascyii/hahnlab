{ config, ... }:

{
  services.ddclient = {
    enable = true;
    protocol = "dyndns2";
    use = "web, web=api.ipify.org";
    server = "dyndns.strato.com/nic/update";
    login = "ascyii.de";
    password = "${config.sops.placeholder.strato-dns-password}";
    domains = [
      "ascyii.de"
      "stack.ascyii.de"
      "jonas.ascyii.de"
      "cloud.ascyii.de"
      "dev.ascyii.de"
      "app.ascyii.de"
      "qrank.ascyii.de"
    ];
  };
}
