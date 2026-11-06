# dotfiles

Personal dotfiles. Use [acofmngr](https://github.com/CyberShadow/aconfmgr/tree/master) to save/apply/check in arch based distros.

Remember set `ACONFMGR_CONFIG=<dotfiles_project>` before execution.

## Home files

[`30-home-files.sh`](30-home-files.sh) installs these files in `$HOME`. Paths are relative to `$HOME`.

Packages marked with `*` are not declared in `20-packages.sh` or `21-aur-packages.sh`.

### Copied files

Each file is copied from `files/homedots/` to the same relative path in `$HOME`. `**` means the files under that directory that the script lists, not necessarily all of them.

| File | Used by |
| --- | --- |
| `.agents/AGENTS.md` | Claude Code\*, `opencode` (through the symlinks below) |
| `.bash_aliases`, `.bash_profile`, `.bashrc` | `bash` |
| `.claude/settings.json` | Claude Code\* |
| `.config/autostart/cairo-dock.desktop` | `cairo-dock` |
| `.config/autostart/com.github.wwmm.easyeffects.desktop` | `easyeffects` |
| `.config/autostart/conky-1.desktop` | `conky` |
| `.config/autostart/firefox-developer-edition.desktop` | `firefox-developer-edition` |
| `.config/autostart/proton-pass.desktop` | `proton-pass-bin` |
| `.config/autostart/proton.vpn.app.gtk.desktop` | `proton-vpn-gtk-app` |
| `.config/autostart/zeitgeist-datahub.desktop` | `zeitgeist` (required by `cairo-dock-plug-ins`) |
| `.config/cairo-dock/themes/personal-custom/**` | `cairo-dock`, `cairo-dock-plug-ins` |
| `.config/cinnamon/spices/**` | `cinnamon` |
| `.config/fastfetch/**` | `fastfetch` |
| `.config/gamemode.ini` | `gamemode` |
| `.config/kitty/**` | `kitty` |
| `.config/MangoHud/**` | `mangohud` |
| `.config/nvim/**` | `neovim` |
| `.config/obs-studio/basic/**` | `obs-studio` |
| `.config/opencode/opencode.jsonc`, `.config/opencode/cli.json` | `opencode` |
| `.config/protonfixes/config.ini` | `umu-launcher` |
| `.config/Proton/VPN/settings.json` | `proton-vpn-gtk-app` |
| `.config/systemd/user/csd-power-watch.service`, `.local/bin/csd-power-watch` | `cinnamon` (user service that watches its `csd-power` plugin) |
| `.config/vesktop/**` | `vesktop` |
| `.config/VSCodium/User/settings.json` | `vscodium-bin` |
| `.config/wireplumber/wireplumber.conf.d/**` | `wireplumber` |
| `.config/zed/keymap.json`, `.config/zed/settings.json` | `zed` |
| `.conkyrc` | `conky` |
| `.dmrc`, `.xprofile` | `lightdm` |
| `.editorconfig` | `neovim`, `zed` |
| `.ignore` | `fd`, `ripgrep` |
| `.lmstudio/config-presets/custom sloth qwen3 coder.preset.json`, `.lmstudio/settings.json` | `lmstudio-bin` |
| `.nv/nvidia-application-profiles-rc` | `nvidia-settings` |
| `.pam_environment` | `pam` |
| `.zshenv`, `.zshrc` | `zsh` |

### Symlinks

| Link | Target | Used by |
| --- | --- | --- |
| `.claude/CLAUDE.md` | `.agents/AGENTS.md` | Claude Code\* |
| `.config/opencode/AGENTS.md` | `.agents/AGENTS.md` | `opencode` |
| `.config/systemd/user/graphical-session.target.wants/csd-power-watch.service` | `.config/systemd/user/csd-power-watch.service` | `systemd`\* (enables the user service at login) |

## /etc files

[`25-etc.sh`](25-etc.sh) installs these files in `/etc`.

### Copied files

Each file is copied from `files/etc/` to the same relative path in `/etc`.

| File | Used by |
| --- | --- |
| `/etc/default/earlyoom` | `earlyoom` |
| `/etc/environment` | `pam` |
| `/etc/lightdm/lightdm.conf.d/50-personal.conf` | `lightdm` |
| `/etc/lightdm/slick-greeter.conf` | `lightdm-slick-greeter` |
| `/etc/locale.conf` | `systemd` |
| `/etc/locale.gen` | `glibc` |
| `/etc/mkinitcpio.conf.d/custom.conf` | `mkinitcpio` |
| `/etc/modprobe.d/custom-nvidia.conf` | `nvidia-open-lts` |
| `/etc/NetworkManager/conf.d/00-default.conf`, `/etc/NetworkManager/conf.d/dhcp-send-hostname.conf`, `/etc/NetworkManager/conf.d/new-mac-on-boot.conf`, `/etc/NetworkManager/conf.d/powersave.conf` | `networkmanager` |
| `/etc/nftables.conf` | `nftables` |
| `/etc/systemd/logind.conf.d/custom.conf` | `systemd` |
| `/etc/systemd/resolved.conf.d/quad9.conf` | `systemd` |
| `/etc/systemd/system/blueman-mechanism.service` | `blueman` |
| `/etc/systemd/system/bluetooth.service` | `bluez` |
| `/etc/systemd/system/nvidia-lock-clocks.service` | `nvidia-utils` (runs `nvidia-smi`) |
| `/etc/systemd/system/rc-local.service` | `systemd` |
| `/etc/systemd/timesyncd.conf.d/cl.conf` | `systemd` |
| `/etc/tlp.d/10-custom.conf` | `tlp` |
| `/etc/vconsole.conf` | `systemd` |
| `/etc/X11/xorg.conf.d/00-keyboard.conf`, `/etc/X11/xorg.conf.d/30-screen.conf`, `/etc/X11/xorg.conf.d/31-ignore-monitor.conf`, `/etc/X11/xorg.conf.d/35-disable-autoadd-devices.conf` | `xorg-server` |

### Symlinks

Links to `/dev/null` mask the unit, so it can't be started.

| Link | Target | Used by |
| --- | --- | --- |
| `/etc/resolv.conf` | `../run/systemd/resolve/stub-resolv.conf` | `systemd` |
| `/etc/systemd/system/multi-user.target.wants/nvidia-lock-clocks.service` | `/etc/systemd/system/nvidia-lock-clocks.service` | `nvidia-utils` |
| `/etc/systemd/system/systemd-networkd.service`, `/etc/systemd/system/systemd-networkd.socket`, `/etc/systemd/system/systemd-networkd-varlink.socket`, `/etc/systemd/system/systemd-networkd-resolve-hook.socket`, `/etc/systemd/system/systemd-networkd-varlink-metrics.socket` | `/dev/null` | `systemd` |
| `/etc/systemd/system/systemd-rfkill.service`, `/etc/systemd/system/systemd-rfkill.socket` | `/dev/null` | `systemd` |

## /usr files

[`25-usr.sh`](25-usr.sh) installs these files in `/usr`.

### Copied files

Each file is copied from `files/usr/` to the same relative path in `/usr`, with mode `755`.

| File | Used by |
| --- | --- |
| `/usr/share/lib/lightdm/display-setup` | `lightdm` (`display-setup-script` in `50-personal.conf`) |
| `/usr/share/lib/lightdm/lightdm-greeter-session` | `lightdm` (`greeter-wrapper` in `50-personal.conf`) |
