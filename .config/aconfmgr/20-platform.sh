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

CopyFile /etc/sysctl.d/10-vm.conf

AddPackage powertop

CopyFile /etc/udev/hwdb.d/99-laptop-keyboard.hwdb
