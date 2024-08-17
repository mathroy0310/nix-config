{pkgs, ...}:
{
  home.packages = with pkgs; [
    libnotify
    ffmpeg
    imagemagick
    
    mpd
    mpc-cli
    ncmpcpp
  ];
  
  home.file = { 
    ".config/ncmpcpp/config".source = ../dotfiles/ncmpcpp/config.conf;
    ".config/ncmpcpp/song_change.sh".source = ../dotfiles/ncmpcpp/song_change.sh;
    ".config/ncmpcpp/bindings".source = ../dotfiles/ncmpcpp/bindings.conf;
    ".config/mpd/mpd.conf".source = ../dotfiles/mpd/mpd.conf;
  };

  services = {
    mpd = {
      enable = true;
      musicDirectory = "~/Music";
      # network = {
      #   startWhenNeeded = true;
      # };
    };
  };          
}