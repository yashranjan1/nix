{
  config,
  lib,
  ...
}: {
  home.activation.copyAgsDefaults = lib.hm.dag.entryAfter ["writeBoundary"] ''
    target_dir="$HOME/.local/share/ags-editable"
    default_dir="${./../../defaults/ags}"

    mkdir -p "$target_dir"

    for file in "$default_dir"/*; do
      base="$(basename "$file")"
      target="$target_dir/$base"
      
      # Only copy the file if it doesn't already exist
      [ ! -f "$target" ] && cp "$file" "$target"
      
      # Make the file writable and executable
      chmod 755 "$target"
    done
  '';
}
