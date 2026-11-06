typeset -U path PATH
path=($HOME/.local/bin $path)
export PATH
export DEFAULT_USER=nicolas

export ACONFMGR_CONFIG=$HOME/dev/nicoaravena/dotfiles

export XDEBUG_CONFIG="idekey=VSCODE"
export MANPATH="/usr/local/man:$MANPATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"

export BROWSER='firefox-developer-edition'
export EDITOR='helix'
export GAMEMODERUNEXEC="env MANGOHUD=1 __NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia"

export SYSTEMD_LESS=FRXMK

# load cargo env
if [[ -f $(which cargo) ]] && [[ -f "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
fi
