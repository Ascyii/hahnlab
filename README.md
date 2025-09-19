# HahnLab

Infrastructure configurations and logs for the homelab stored and versionized.

## Installation

Install proxmox from https://www.proxmox.com/en/ and install it to the metal.
Setup a nixos https://nixos.org/download/#nix-install-linux machine for the main host.

## Secrets

The secrets are all managed by sops for the whole project. They are encrypted and then commited to git.
The key file for age should be present in `~/.config/age/sops/keys.txt`. For the editing of secrets to work properly.

Run to discover the public key of the machine
nix-shell -p ssh-to-age --run 'cat /etc/ssh/ssh_host_ed25519_key.pub | ssh-to-age'
