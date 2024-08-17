{ config, pkgs, inputs, ... }:
{
  home.username = "maroy";
  home.homeDirectory = "/home/maroy";

  home.stateVersion = "24.05";


  home.packages = with pkgs; [
    discord
    libgcc
    qemu
    onefetch
    neofetch
    cpufetch
    valgrind

    xclip

    zigpkgs.master
    ncdu

    # Programming Utils
    gnumake42
              
    gdb
    clang
    lld
    clang-tools


  ];

  home.file = {
    ".config/hypr/hyprland.conf".source = ../config/hypr/hyprland.conf;
    ".config/eww/eww.scss".source = ../config/eww/eww.scss;

    ".config/kitty/kitty.conf".source = ../config/kitty/kitty.conf;
    ".config/kitty/theme.conf".source = ../config/kitty/github_dark.conf;
    ".config/ncdu/config".source = ../config/ncdu;
    ".config/lazygit/config.yml".source = ../config/lazygit.yml;
    ".config/starship.toml".source = ../config/starship.toml;
  };

  
  home.sessionVariables = {
    EDITOR = "vscode";
  };

  programs = {
    firefox.enable = true;
    lazygit.enable = true;
    htop.enable = true;
    btop.enable = true;
    bat.enable = true;
    ripgrep.enable = true;
    fastfetch.enable = true;
    starship.enable = true;


    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;    
      lfs.enable = true;
      userEmail = "maroy0310@gmail.com";
      userName = "maroy0310";
      extraConfig = {
        init.defaultBranch = "master";
        commit.gpgsign = true;
        gpg.format = "ssh";
        user.signingKey = "~/.ssh/id_ed25519_sign.pub";
      };
    };

    eza = {
      enable = true;
      icons = true;
      git = true;
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      defaultKeymap = "emacs";
      shellAliases = {
        ls = "eza";
        l = "eza -lab"; 
        cat = "bat";
        lg = "lazygit";
        mp = "ncmpcpp";
      };
    };
  };

  programs.home-manager.enable = true;  
}
