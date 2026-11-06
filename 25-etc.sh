CopyFile /etc/environment
CopyFile /etc/default/earlyoom
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen
CopyFile /etc/lightdm/lightdm.conf.d/50-personal.conf
CopyFile /etc/lightdm/slick-greeter.conf
CopyFile /etc/mkinitcpio.conf.d/custom.conf
CopyFile /etc/modprobe.d/custom-nvidia.conf
CopyFile /etc/NetworkManager/conf.d/00-default.conf
CopyFile /etc/NetworkManager/conf.d/dhcp-send-hostname.conf
CopyFile /etc/NetworkManager/conf.d/new-mac-on-boot.conf
CopyFile /etc/NetworkManager/conf.d/powersave.conf
CopyFile /etc/nftables.conf
CopyFile /etc/systemd/logind.conf.d/custom.conf
CopyFile /etc/systemd/resolved.conf.d/quad9.conf
CopyFile /etc/systemd/system/nvidia-lock-clocks.service
CopyFile /etc/systemd/timesyncd.conf.d/cl.conf
CopyFile /etc/tlp.d/10-custom.conf
CopyFile /etc/vconsole.conf
CopyFile /etc/X11/xorg.conf.d/00-keyboard.conf
CopyFile /etc/X11/xorg.conf.d/30-screen.conf
CopyFile /etc/X11/xorg.conf.d/31-ignore-monitor.conf
CopyFile /etc/X11/xorg.conf.d/35-disable-autoadd-devices.conf

CreateLink /etc/resolv.conf ../run/systemd/resolve/stub-resolv.conf
CreateLink /etc/systemd/system/multi-user.target.wants/nvidia-lock-clocks.service /etc/systemd/system/nvidia-lock-clocks.service
CreateLink /etc/systemd/system/systemd-networkd.service /dev/null
CreateLink /etc/systemd/system/systemd-networkd.socket /dev/null
CreateLink /etc/systemd/system/systemd-networkd-varlink.socket /dev/null
CreateLink /etc/systemd/system/systemd-networkd-resolve-hook.socket /dev/null
CreateLink /etc/systemd/system/systemd-networkd-varlink-metrics.socket /dev/null
CreateLink /etc/systemd/system/systemd-rfkill.service /dev/null
CreateLink /etc/systemd/system/systemd-rfkill.socket /dev/null
