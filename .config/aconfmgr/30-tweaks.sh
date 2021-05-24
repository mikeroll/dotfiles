#
# System Tools
#
AddPackage pacman-contrib # Contributed scripts and tools for pacman systems
AddPackage reflector
CreateLink /etc/systemd/system/multi-user.target.wants/reflector.service /usr/lib/systemd/system/reflector.service
CopyFile /etc/xdg/reflector/reflector.conf
