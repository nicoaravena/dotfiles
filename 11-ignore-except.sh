function IgnorePathsExcept() {
    # Ignore all paths in the given directory (first parameter)
    # that do not match the given whitelist (second parameter)

    local search_dir="${1%/}"
    shift
    local white_list=("$@")
    local find_args=()
    local ignore_path

    if [ ! -d "$search_dir" ]; then
        FatalError "The path ${search_dir} must be an existing directory\n"
    fi

    for ignore_path in "${white_list[@]}"; do
        local base="$ignore_path"
        if [[ "$ignore_path" =~ ^/ ]]; then
            FatalError "The path ${ignore_path} in the whitelist is not relative to the directory ${search_dir}\n"
        fi
        # Add all base paths to the argument list as well, otherwise
        # -prune will prevent us from reaching the whitelisted files.
        while [ "$base" != '.' ]; do
            find_args+=(-path "$search_dir/$base" -o)
            base="$(dirname "$base")"
        done
    done

    # Find everything except the given whitelist and the directory
    # being searched from
    find "$search_dir" -not \( "${find_args[@]}" -path "$search_dir" \) -prune | \
        while read -r file; do
            if [[ -d "$file" ]]; then
                IgnorePath "$file/*"
            fi
            IgnorePath "$file"
        done
}

etc_white_list=(
    'lightdm/lightdm.conf.d/*'
    'lightdm/slick-greeter.conf'
    'locale.gen'
    'mkinitcpio.conf.d/*'
    'modprobe.d/*'
    'NetworkManager/conf.d/*'
    'resolv.conf'
    'systemd/logind.conf.d/*'
    'systemd/resolved.conf.d/*'
    'systemd/timesyncd.conf.d/*'
    'tlp.d/*'
    'udev/rules.d/*'
    'vsconsole.conf'
    'X11/xorg.conf.d/*'
)
IgnorePathsExcept /etc "${etc_white_list[@]}"

home_white_list=(
    '.bashrc'
    '.bash_profile'
    '.bash_aliases'
    '.claude/settings.json'
    '.claude/CLAUDE.md'
    '.conkyrc'
    '.config/autostart/*'
    '.config/cairo-dock/themes/personal-custom/*'
    '.config/cinnamon/spices/*'
    '.config/fastfetch/*'
    '.config/kitty/*'
    '.config/MangoHud/*'
    '.config/nvim/lsp/*'
    '.config/nvim/lua/*'
    '.config/obs-studio/basic/*'
    '.config/opencode/opencode.jsonc'
    '.config/opencode/tui.jsonc'
    '.config/Proton/VPN/settings.json'
    '.config/protonfixes/config.ini'
    '.config/vesktop/settings.json'
    '.config/vesktop/settings/*'
    '.config/vesktop/themes/*'
    '.config/vkBasalt'
    '.config/VSCodium/User/settings.json'
    '.config/wireplumber/wireplumber.conf.d/*'
    '.config/zed/*'
    '.dmrc'
    '.editorconfig'
    '.ignore'
    '.nv/nvidia-application-profiles-rc'
    '.pam_environment'
    '.xprofile'
    '.zshenv'
    '.zshrc'
)
IgnorePathsExcept ${HOME} "${home_white_list[@]}"
