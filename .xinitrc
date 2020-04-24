# Load X settings
xrdb -merge ~/.Xresources

# Load key mods
xmodmap ~/.config/.xmodmap

# Set wallpaper
feh --bg-fill ~/Pictures/wallpaper.jpg

# Start picom/compton
picom --config ~/.config/compton/compton.conf -b --focus-exclude "x == 0 && y == 0 && override_redirect = true"

# Start dwm
exec dwm
