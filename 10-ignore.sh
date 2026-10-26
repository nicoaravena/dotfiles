# override ignore_paths
ignore_paths=(
    '/dev'
    #'/home'
    '/media'
    '/mnt'
    '/proc'
    '/root'
    '/run'
    '/sys'
    '/tmp'
    # '/var/.updated'
    '/var/cache'
    # '/var/lib'
    # '/var/lock'
    # '/var/log'
    # '/var/spool'
)

function IgnoreAllPackages() {
    mapfile -t ignore_foreign_packages < <(pacman -Qqm)
    #mapfile -t ignore_packages < <(pacman -Qqn)
}

IgnorePath '/boot/*'
IgnorePath '/var/*'
IgnorePath '/opt/*'
IgnorePath '/srv/*'
IgnorePath '/etc/ssl/*'
IgnorePath '/etc/ca-certificates/*'
IgnorePath '/etc/libvirt/*'
IgnorePath '/etc/fonts/*'
IgnorePath "$HOME/.config/MangoHud/MangoHud.conf"

IgnoreAllPackages
