function AddAurPackage() {
    LogEnter "Start installing aur packages\n"
    if [[ $aconfmgr_action != 'apply' ]]; then
        Log "AddAurPackage only runs in apply mode\n"
        LogLeave
        return
    fi
    local packages=("$@")
    local current_dir="$PWD"
    local tmp_aur_dir="${tmp_dir}/aur"
    local package=
    if [ ! -d "$tmp_aur_dir" ]; then
        mkdir -p ${tmp_aur_dir}
    else
        Log "Cleaning tmp dir ${tmp_aur_dir}"
        rm -rf "${tmp_aur_dir}/*"
    fi

    sudo ${PACMAN} -S --needed base-devel
    cd ${tmp_aur_dir}
    for package in "${packages[@]}"; do
        if [[ -z $($PACMAN --query --quiet ${package}) ]]; then
            git clone https://aur.archlinux.org/${package}.git ${package}
            cd ${package}
            makepkg -si
            cd ..
        else
            Log "Package ${package} already installed, skipping...\n"
        fi
    done
    cd $current_dir
    rm -rf ${tmp_aur_dir}
    LogLeave
}

packages=(
    'audiveris' # Music score OMR engine
    'chkrootkit' # Locally checks for signs of a rootkit
    'cinnamon-sounds' # Cinnamon desktop sounds extracted from Linuxmint (mint-artwork)
    'clockenstein' # Calendar application with local, Google and CalDAV support
    'dell-command-configure' # Configure various BIOS features on Dell laptops
    'kando-bin' # A pie menu for the desktop. It will be highly customizable and will allow you to create your own menus and actions.
    'lazybw-bin' # A keyboard-first terminal UI for the Bitwarden vault (static binary)
    'lightdm-settings' # A configuration tool for the LightDM display manager
    'lmstudio-bin' # LM Studio - A desktop app for exploring and running large language models locally
    'mangojuice' # A convenient alternative to GOverlay for configuring MangoHud
    'mint-themes' # A collection of Mint themes.
    'mintlocale' # Language and locale selection tool
    'paru' # Feature packed AUR helper
    'pix' # Image viewer and browser based on gthumb. X-Apps Project.
    'plusalator' # Fancy interactive C++17 calculator REPL
    'plymouth-theme-colorful-loop-git' # The plymouth theme collection by adi1090x
    'rustdesk-bin' # Yet another remote desktop software, written in Rust. Works out of the box, no configuration required.
    'sable-bin' # A Matrix client
    'unfold-xapp' # Archive Manager for Linux Desktops
    'vesktop' # A standalone Electron-based Discord app with Vencord & improved Linux support
    'vscodium-bin' # Binary releases of VS Code without MS branding/telemetry/licensing.
)


AddAurPackage "${packages[@]}"
