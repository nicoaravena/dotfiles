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
    'aconfmgr-git' # A configuration manager for Arch Linux
    'audiveris' # Music score OMR engine
    'cinnamon-sounds' # Cinnamon desktop sounds extracted from Linuxmint (mint-artwork)
    'dell-command-configure' # Configure various BIOS features on Dell laptops
    'gtk-engine-murrine' # GTK2 engine to make your desktop look like a 'murrina', an italian word meaning the art glass works done by Venicians glass blowers.
    'lightdm-settings' # A configuration tool for the LightDM display manager
    'mint-themes' # A collection of Mint themes.
    'mintlocale' # Language and locale selection tool
    'paru' # Feature packed AUR helper
    'pix' # Image viewer and browser based on gthumb. X-Apps Project.
    'plymouth-theme-colorful-loop-git' # The plymouth theme collection by adi1090x
    'proton-drive-cli-bin' # Official Proton Drive command-line client (precompiled binary)
    'proton-pass-bin' # Open-source password manager for effortless protection. Securely store, share and auto-login your accounts with Proton Pass, using end-to-end encryption trusted by millions.
    'vesktop' # A standalone Electron-based Discord app with Vencord & improved Linux support
    'vscodium-bin' # Binary releases of VS Code without MS branding/telemetry/licensing.
)


AddAurPackage "${packages[@]}"
