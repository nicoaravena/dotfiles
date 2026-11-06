# --------------
# custom aliases
# --------------
ff-salute() {
  if [[ -z "$(command -v fastfetch)" ]] || [[ ! -f "$(command -v fastfetch)" ]]; then
    echo 'fastfetch is not installed'
    return 1
  fi
  if [[ ! -f ~/.config/fastfetch/salute.jsonc ]]; then
    echo '~/.config/fastfetch/salute.jsonc file not found'
    return 1
  fi
  fastfetch -c ~/.config/fastfetch/salute.jsonc
}

if [[ -f "$(command -v codium)" ]]; then
  # override code with codium
  alias code=codium
fi

if [[ -f "$(command -v pnpm)" ]]; then
  # override npm with pnpm
  alias npm=pnpm
fi
