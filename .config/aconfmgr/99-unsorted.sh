AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux

# base
AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage efibootmgr # Tool to modify UEFI Firmware Boot Manager Variables
AddPackage linux # The Linux kernel and modules
AddPackage linux-firmware # Firmware files for Linux
AddPackage sudo # Give certain users the ability to run some commands as root

CopyFile /etc/makepkg.conf
CopyFile /etc/mkinitcpio.conf

CreateLink /etc/systemd/user/sockets.target.wants/dirmngr.socket /usr/lib/systemd/user/dirmngr.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-browser.socket /usr/lib/systemd/user/gpg-agent-browser.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-extra.socket /usr/lib/systemd/user/gpg-agent-extra.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent-ssh.socket /usr/lib/systemd/user/gpg-agent-ssh.socket
CreateLink /etc/systemd/user/sockets.target.wants/gpg-agent.socket /usr/lib/systemd/user/gpg-agent.socket
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket

CopyFile /etc/locale.gen
CreateLink /etc/localtime /usr/share/zoneinfo/Europe/Minsk
CopyFile /etc/hostname
CopyFile /etc/hosts


# Network
CopyFile /etc/systemd/network/20-wired.network
CreateLink /etc/systemd/system/dbus-org.freedesktop.network1.service /usr/lib/systemd/system/systemd-networkd.service
CreateLink /etc/systemd/system/multi-user.target.wants/dhclient@enp5s0.service /usr/lib/systemd/system/dhclient@.service
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateLink /etc/systemd/system/multi-user.target.wants/systemd-networkd.service /usr/lib/systemd/system/systemd-networkd.service
CreateLink /etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service /usr/lib/systemd/system/systemd-networkd-wait-online.service
CreateLink /etc/systemd/system/sockets.target.wants/systemd-networkd.socket /usr/lib/systemd/system/systemd-networkd.socket


# base-devel
AddPackage autoconf # A GNU tool for automatically configuring source code
AddPackage automake # A GNU tool for automatically creating Makefiles
AddPackage binutils # A set of programs to assemble and manipulate binary and object files
AddPackage bison # The GNU general-purpose parser generator
AddPackage fakeroot # Tool for simulating superuser privileges
AddPackage flex # A tool for generating text-scanning programs
AddPackage gcc # The GNU Compiler Collection - C and C++ frontends
AddPackage groff # GNU troff text-formatting system
AddPackage libtool # A generic library support script
AddPackage m4 # The GNU macro processor
AddPackage make # GNU make utility to maintain groups of programs
AddPackage man-db # A utility for reading man pages
AddPackage patch # A utility to apply patch files to original sources
AddPackage pkgconf # Package compiler and linker metadata toolkit
AddPackage termite # A simple VTE-based terminal
AddPackage texinfo # GNU documentation system for on-line information and printed output
AddPackage which # A utility to show the full path of commands


# Configure swap
AddPackage systemd-swap # Script for creating hybrid swap space from zram swaps, swap files and swap partitions.
CopyFile /etc/sysctl.d/10-vm.conf
CopyFile /etc/systemd/swap.conf
CreateLink /etc/systemd/system/local-fs.target.wants/systemd-swap.service /usr/lib/systemd/system/systemd-swap.service


# Hardware
AddPackage amd-ucode # Microcode update files for AMD CPUs

AddPackage nvidia # NVIDIA drivers for linux
CopyFile /etc/X11/xorg.conf.d/10-nvidia.conf

AddPackage lm_sensors # Collection of user space tools for general SMBus access and hardware monitoring
CopyFile /etc/conf.d/lm_sensors
CreateLink /etc/systemd/system/multi-user.target.wants/lm_sensors.service /usr/lib/systemd/system/lm_sensors.service

# Sound
AddPackage alsa-utils # An alternative implementation of Linux sound support
AddPackage pulseaudio # A featureful, general-purpose sound server
AddPackage pulseaudio-alsa # ALSA Configuration for PulseAudio
AddPackage pulsemixer # CLI and curses mixer for pulseaudio
CreateLink /etc/systemd/user/sockets.target.wants/pulseaudio.socket /usr/lib/systemd/user/pulseaudio.socket


# Autologin
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CopyFile /etc/systemd/system/getty@tty1.service.d/override.conf


# Tools
AddPackage --foreign yay-bin # Yet another yogurt. Pacman wrapper and AUR helper written in go. Pre-compiled.

AddPackage git # the fast distributed version control system
AddPackage neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs
AddPackage htop # Interactive process viewer
AddPackage zsh # A very advanced and programmable command interpreter (shell) for UNIX
AddPackage openssh # Premier connectivity tool for remote login with the SSH protocol
AddPackage tree # A directory listing program displaying a depth indented list of files

# Desktop
AddPackage bspwm # Tiling window manager based on binary space partitioning
AddPackage sxhkd # Simple X hotkey daemon
AddPackage feh # Fast and light imlib2-based image viewer
AddPackage xorg-server-xephyr # A nested X server that runs as an X application
AddPackage xorg-xinit # X.Org initialisation program
AddPackage xorg-xset # User preference utility for X
AddPackage xorg-xsetroot # Classic X utility to set your root window background to a given pattern or color
AddPackage redshift # Adjusts the color temperature of your screen according to your surroundings.
AddPackage --foreign picom-git # X compositor (fork of compton) (git-version)
AddPackage --foreign polybar # A fast and easy-to-use status bar
AddPackage --foreign ttf-iosevka # A slender monospace typeface. Shape
AddPackage --foreign ttf-iosevka-term # A slender monospace typeface. Shape
AddPackage --foreign dmenu2 # Fork of dmenu with many useful patches applied and additional options like screen select, dim or opacity change

# Apps
AddPackage chromium # A web browser built for speed, simplicity, and security
AddPackage code # The Open Source build of Visual Studio Code (vscode) editor
AddPackage firefox # Standalone web browser from mozilla.org
AddPackage kitty # A simple VTE-based terminal
AddPackage xclip # Command line interface to the X11 clipboard
