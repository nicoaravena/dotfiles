#------------------------------
# OMZ
#------------------------------
export ZSH=~/.oh-my-zsh
ZSH_THEME='agnoster'
zstyle ':omz:update' frequency 13
DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(battery colored-man-pages colorize fancy-ctrl-z history kitty sudo uv)
source $ZSH/oh-my-zsh.sh

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# -------------------
# custom integrations
# -------------------
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
  source /usr/share/doc/pkgfile/command-not-found.zsh
fi
if [[ -f /usr/share/nvm/init-nvm.sh ]]; then
  source /usr/share/nvm/init-nvm.sh
fi
if test -n "$KITTY_INSTALLATION_DIR"; then
  export KITTY_SHELL_INTEGRATION="enabled"
  source "$KITTY_INSTALLATION_DIR/shell-integration/zsh/kitty.zsh"
fi

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
