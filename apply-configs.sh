#!/bin/sh

echo "Applying NixOS and Home Manager configurations..."
# Apply NixOS configuration
sudo nixos-rebuild switch --flake .#nixos > /dev/null 2>&1
echo "NixOS configuration applied"

# Apply Home Manager configuration
nix run .#homeConfigurations.maroy.activationPackage --impure > /dev/null 2>&1
echo "Home Manager configuration applied"