#
# Platform & PM
#
AddPackage intel-ucode
AddPackage linux-firmware # Firmware files for Linux
AddPackage fwupd # Simple daemon to allow session software to update firmware
AddPackage efibootmgr # Tool to modify UEFI Firmware Boot Manager Variables
CopyFile /etc/makepkg.conf
CopyFile /etc/mkinitcpio.conf

AddPackage lm_sensors # Collection of user space tools for general SMBus access and hardware monitoring
CopyFile /etc/conf.d/lm_sensors
CreateLink /etc/systemd/system/multi-user.target.wants/lm_sensors.service /usr/lib/systemd/system/lm_sensors.service

# Power management
AddPackage powertop
CopyFile /etc/modprobe.d/bluetooth.conf
CopyFile /etc/modprobe.d/i915.conf
CopyFile /etc/modprobe.d/iwlwifi.conf
CopyFile /etc/sysctl.d/nmi_watchdog.conf
CopyFile /etc/udev/rules.d/90-runtime-pm.rules
CopyFile /etc/sysctl.d/10-vm.conf

# Device tweaks
CopyFile /etc/udev/hwdb.d/99-laptop-keyboard.hwdb
