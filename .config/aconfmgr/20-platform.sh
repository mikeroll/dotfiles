#
# Platform & PM
#

AddPackage linux-firmware # Firmware files for Linux
AddPackage efibootmgr # Tool to modify UEFI Firmware Boot Manager Variables
CopyHostSpecificFile /etc/mkinitcpio.conf

case "${HOSTNAME}" in
dumpster)
	AddPackage intel-ucode
	AddPackage fwupd # Simple daemon to allow session software to update firmware

	CopyFile /etc/modprobe.d/i915.conf
	AddPackage intel-media-driver

	AddPackage light # Program to easily change brightness on backlight-controllers.
	CreateDir /etc/light
	;;
esac


# Sensors
AddPackage lm_sensors # Collection of user space tools for general SMBus access and hardware monitoring
CopyHostSpecificFile /etc/conf.d/lm_sensors
CreateLink /etc/systemd/system/multi-user.target.wants/lm_sensors.service /usr/lib/systemd/system/lm_sensors.service

# Power management
AddPackage powertop
CopyFile /etc/modprobe.d/bluetooth.conf
CopyFile /etc/modprobe.d/iwlwifi.conf
CopyFile /etc/sysctl.d/nmi_watchdog.conf
CopyFile /etc/udev/rules.d/90-runtime-pm.rules
CopyFile /etc/sysctl.d/10-vm.conf

# Device tweaks
CopyFile /etc/udev/hwdb.d/99-laptop-keyboard.hwdb
