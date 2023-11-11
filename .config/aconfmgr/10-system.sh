#
# Essentials
#
AddPackage archlinux-keyring # Arch Linux PGP keyring
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel # Basic tools to build Arch Linux packages
AddPackage --foreign yay-bin # Yet another yogurt. Pacman wrapper and AUR helper written in go. Pre-compiled.
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux


#
# Kernel & boot
# 
AddPackage linux # The Linux kernel and modules
AddPackage linux-headers # Headers and scripts for building modules for the Linux kernel
AddPackage linux-firmware # Firmware files for Linux
AddPackage efibootmgr # Tool to modify UEFI Firmware Boot Manager Variables
CopyFile /etc/mkinitcpio.conf
CopyFile /etc/mkinitcpio.d/linux.preset


#
# OS components
#
sed -i "/MAKEFLAGS=/c\MAKEFLAGS=\"-j$(nproc)\"" "$(GetPackageOriginalFile pacman /etc/makepkg.conf)"
AddPackage exfatprogs # exFAT filesystem userspace utilities for the Linux Kernel exfat driver
AddPackage ncdu # Disk usage analyzer with an ncurses interface
AddPackage pacman-contrib # Contributed scripts and tools for pacman systems
AddPackage sudo # Give certain users the ability to run some commands as root
AddPackage udisks2 # Disk Management Service, version 2
CreateLink /etc/systemd/system/dbus-org.freedesktop.oom1.service /usr/lib/systemd/system/systemd-oomd.service
CreateLink /etc/systemd/system/multi-user.target.wants/systemd-oomd.service /usr/lib/systemd/system/systemd-oomd.service


#
# Platform
#
# Power management
AddPackage powertop
CopyFile /etc/sysctl.d/10-vm.conf
CopyFile /etc/sysctl.d/11-nmi-watchdog.conf

# SSD TRIM
CreateLink /etc/systemd/system/timers.target.wants/fstrim.timer /usr/lib/systemd/system/fstrim.timer

# Sensors
AddPackage lm_sensors
CopyFile /etc/conf.d/lm_sensors
CreateLink /etc/systemd/system/multi-user.target.wants/lm_sensors.service /usr/lib/systemd/system/lm_sensors.service

# Machine-specific
case "${HOSTNAME}" in
brick)
	AddPackage amd-ucode
	AddPackage plymouth
	;;
dumpster)
	AddPackage fwupd # Simple daemon to allow session software to update firmware
	AddPackage intel-gpu-tools # Tools for development and testing of the Intel DRM driver
	AddPackage intel-media-driver
	AddPackage intel-ucode
	AddPackage usbutils # A collection of USB tools to query connected USB devices
	CopyFile /etc/modprobe.d/bluetooth.conf
	CopyFile /etc/modprobe.d/i915.conf
	CopyFile /etc/modprobe.d/iwlwifi.conf
	CopyFile /etc/modprobe.d/nouveau.conf
	CopyFile /etc/modprobe.d/psmouse.conf
	CopyFile /etc/udev/hwdb.d/99-laptop-keyboard.hwdb
	CopyFile /etc/udev/rules.d/00-no-nvidia.rules
	CopyFile /etc/udev/rules.d/90-runtime-pm.rules

	AddPackage lvm2

	AddPackage light # Program to easily change brightness on backlight-controllers.
	CreateDir /etc/light
	;;
esac


#
# Network
#
# NetworkManager
AddPackage networkmanager
AddPackage wireless-regdb # Central Regulatory Domain Database
CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service

# systemd-resolved
CreateLink /etc/systemd/system/dbus-org.freedesktop.resolve1.service /usr/lib/systemd/system/systemd-resolved.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-resolved.service /usr/lib/systemd/system/systemd-resolved.service


#
# Audio / Video
#
AddPackage pamixer # Pulseaudio command-line mixer like amixer
AddPackage pipewire # Low-latency audio/video router and processor
AddPackage pipewire-pulse # Low-latency audio/video router and processor - PulseAudio replacement
AddPackage pulsemixer # CLI and curses mixer for pulseaudio
AddPackage wireplumber # Session / policy manager implementation for PipeWire

CreateLink /etc/systemd/user/pipewire-session-manager.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/pipewire.service.wants/wireplumber.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/sockets.target.wants/pipewire-pulse.socket /usr/lib/systemd/user/pipewire-pulse.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket

#
# Locale
#
CopyFile /etc/locale.gen
CopyFile /etc/locale.conf
CopyFile /etc/vconsole.conf


#
# Time
#
CreateLink /etc/localtime /usr/share/zoneinfo/"${TIMEZONE}"
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service


#
# Auth
#
CopyFile /etc/pam.d/login
CopyFile /etc/pam.d/passwd

AddPackage gnome-keyring # Stores passwords and encryption keys
