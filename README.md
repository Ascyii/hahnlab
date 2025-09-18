# HahnLab

Infrastructure configurations and logs for the homelab stored and versionized.

## Installation

Install proxmox from https://www.proxmox.com/en/ and install it to the metal.

Setup a nixos https://nixos.org/download/#nix-install-linux machine for the main host.

To partition the disks run the following command (this will erase all data on the disks specified in the configuration for the machine and should be only run once in the beginning).
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./nixos/hosts/<host>/disko.nix

Install the nixos machine with flakes onto proxmox and make it starting by default.

Note down FQDN and the password from the proxmox installation.

Pull up all the docker fleets.

## Services 

### Nextcloud

Access the cloud on cloud.ascyii.de and use the admin panel only locally on port 8088.

## Secrets

The secrets are all managed by sops for the whole project. They are encrypted and then commited to git.
The key file for age should be present in `~/.config/age/sops/keys.txt`. For the editing of secrets to work properly.

Run to discover the public key of the machine
nix-shell -p ssh-to-age --run 'cat /etc/ssh/ssh_host_ed25519_key.pub | ssh-to-age'

## Technologies and dependencies

- Proxmox with Nixos on Linux
- Docker with compose and caddy
- Strato for cloud services
