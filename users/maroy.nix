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
    ncdu

    xclip

    zls
    zigpkgs.master

    # Programming Utils
    gnumake42
              
    gdb
    clang
    lld
    clang-tools


  ];

  home.file = {
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

    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        ziglang.vscode-zig
        jnoortheen.nix-ide
        vadimcn.vscode-lldb
        ms-vscode.cpptools
        github.github-vscode-theme
        pkief.material-icon-theme 
        ms-vscode.cpptools-extension-pack
      ];

      userSettings = {    
        "files.autoSave" = "afterDelay";
        "files.autoSaveDelay" = "1000" ;
        "workbench.colorTheme" = "GitHub Dark Default";
        "zig.path" = "zig";
        "zig.zls.path" = "zls";
        "zig.initialSetupDone" = "true";
        "workbench.iconTheme" = "material-icon-theme";
      };
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;    
      lfs.enable = true;
      userEmail = "mathroy0310@gmail.com";
      userName = "mathroy0310"; 
      extraConfig = {
        init.defaultBranch = "master";
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
