#!/usr/bin/env zsh

# Resolve commands using `which`
WAL_BIN=$(which wal)
SWWW_BIN=$(which swww)

# Check if commands were found
if [[ -z "$WAL_BIN" || -z "$SWWW_BIN" ]]; then
    echo "Error: 'wal' or 'swww' not found in PATH."
    echo "wal: $WAL_BIN"
    echo "swww: $SWWW_BIN"
    exit 1
fi

# Validate wallpaper path input
if [ -z "$1" ]; then
    echo "Usage: $0 <path-to-wallpaper>"
    exit 1
fi

# Variables
path="$1"
config_file="$HOME/.config/hypr/options.conf"

# Update config
echo "\$wp = $path" >"$config_file"

# Set colors and wallpaper
"$WAL_BIN" -i "$path"
"$SWWW_BIN" img "$path" --transition-type wipe --transition-fps 90 --transition-step 30
