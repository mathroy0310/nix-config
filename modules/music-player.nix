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
    ".config/ncmpcpp/config".source = ../config/ncmpcpp/config.conf;
    ".config/ncmpcpp/song_change.sh".source = ../config/ncmpcpp/song_change.sh;
    ".config/ncmpcpp/bindings".source = ../config/ncmpcpp/bindings.conf;
    ".config/mpd/mpd.conf".source = ../config/mpd/mpd.conf;
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