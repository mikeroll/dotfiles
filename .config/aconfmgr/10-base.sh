#
# Bootstrap
#
AddPackage --foreign yay-bin # Yet another yogurt. Pacman wrapper and AUR helper written in go. Pre-compiled.
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux


#
# Basics
#
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackageGroup base-devel
AddPackage linux # The Linux kernel and modules
AddPackage linux-headers # Headers and scripts for building modules for the Linux kernel
AddPackage sudo # Give certain users the ability to run some commands as root
AddPackage lvm2
CopyFile /etc/locale.gen
CopyFile /etc/locale.conf
CopyFile /etc/vconsole.conf

WriteHostsFile "${HOSTNAME}"
ConfigureMakepkg

CreateLink /etc/localtime /usr/share/zoneinfo/"${TIMEZONE}"
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service

CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
