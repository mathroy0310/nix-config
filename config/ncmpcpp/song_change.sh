#!/bin/sh

current_song_file="/tmp/ncmpcpp_current_song"
new_song=$(mpc current -f "%file%")

if [ -f "$current_song_file" ] && [ "$(cat "$current_song_file")" = "$new_song" ]; then
    exit 0
fi

echo "$new_song" > "$current_song_file"

current_song=$(mpc current -f "%title%")
current_artist=$(mpc current -f "%artist%")
current_album=$(mpc current -f "%album%")
music_dir=~/Music
full_path="$music_dir/$new_song"
temp_image="/tmp/current_song_artwork.png"

ffmpeg -y -i "$full_path" -an -vframes 1 "$temp_image" >/dev/null 2>&1

if [ ! -f "$temp_image" ] || [ ! -s "$temp_image" ]; then
    temp_image="audio-x-generic"
fi

notify-send "Now Playing" "$current_song by $current_artist" -i "$temp_image"

if [ "$temp_image" != "audio-x-generic" ]; then
    rm "$temp_image"
fi
