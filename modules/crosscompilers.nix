{ config, pkgs, inputs, ... }:

let
    cross_x86_64 = import <nixpkgs> { 
      crossSystem.config = "x86_64-elf"; 
    };
    cross_i686 = import <nixpkgs> { 
      crossSystem.config = "i686-elf"; 
    };
in
{
  home.packages = with pkgs; [
    grub2      # for grub-mkrescue, grub-file
    libisoburn # xorriso

    cross_x86_64.buildPackages.gcc
    cross_i686.buildPackages.gcc

    parted # for partprobe  
  ];
} 