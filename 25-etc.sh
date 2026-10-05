CopyFile /etc/NetworkManager/conf.d/dhcp-send-hostname.conf
CopyFile /etc/NetworkManager/conf.d/powersave.conf
CopyFile /etc/X11/xorg.conf.d/00-keyboard.conf
CopyFile /etc/X11/xorg.conf.d/30-screen.conf
CopyFile /etc/X11/xorg.conf.d/31-ignore-monitor.conf
CopyFile /etc/X11/xorg.conf.d/35-disable-autoadd-devices.conf
CopyFile /etc/lightdm/lightdm.conf.d/50-personal.conf
CopyFile /etc/lightdm/slick-greeter.conf
CopyFile /etc/mkinitcpio.conf.d/custom.conf
CopyFile /etc/modprobe.d/custom-nvidia.conf
CopyFile /etc/systemd/logind.conf.d/custom.conf
CopyFile /etc/systemd/resolved.conf.d/quad9.conf
CopyFile /etc/systemd/timesyncd.conf.d/cl.conf
CopyFile /etc/tlp.d/10-custom.conf
CopyFile /etc/udev/rules.d/80-nvidia-pm.rules
CopyFile /etc/locale.gen

CreateLink /etc/resolv.conf /run/systemd/resolve/resolv.conf
