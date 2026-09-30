typeset -U path PATH
path=($HOME/.local/bin $path)
export PATH
export DEFAULT_USER=nicolas

export ACONFMGR_CONFIG=$HOME/dev/gitlab/nicoaravena/dotfiles

export XDEBUG_CONFIG="idekey=VSCODE"
export MANPATH="/usr/local/man:$MANPATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"

export BROWSER='firefox-developer-edition'
export EDITOR='helix'
export GAMEMODERUNEXEC="env MANGOHUD=1"

# load cargo env
if [[ -f $(which cargo) ]] && [[ -f "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
fi
