# custom aliases
if [[ -f $(which fastfetch) ]] && [[ -f "$HOME/.config/fastfetch/salute.jsonc" ]]; then
    alias ff-salute=fastfetch -c ~/.config/fastfetch/salute.jsonc
fi

if [[ -f $(which codium) ]] && [[ ! -f $(which code) ]]; then
  alias code=codium
fi
