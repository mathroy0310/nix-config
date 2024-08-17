{ pkgs, ... }:

{
  
  programs.hyprland.enable = true;
  programs.hyprland.kb_layout = "us";
  security.pam.services.swaylock.text = "auth include login";

  environment.systemPackages = with pkgs; [
    swaylock-effects
    swayidle
    dunst
    swaybg
    wl-clipboard
    # TODO: gsettings + a default theme
    grim
    slurp
    hyprpicker #TODO: remove this, we dont really need it
    eww
    xdg-utils
    wayvnc
    mate.mate-polkit #TODO: fix polkit not autostarting
    ];

  environment.sessionVariables = {
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };
}