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
