#
# DE
#
AddPackage aria2 # Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink
AddPackage dex # Program to generate and execute DesktopEntry files of type Application
AddPackage grim
AddPackage kanshi
AddPackage libnotify # Library for sending desktop notifications
AddPackage lxsession-gtk3 # Lightweight X11 session manager (GTK+ 3 version)
AddPackage mako # Lightweight notification daemon for Wayland
AddPackage slurp
AddPackage swappy # A Wayland native snapshot editing tool
AddPackage sway
AddPackage swaybg
AddPackage swayidle # Idle management daemon for Wayland
AddPackage swaylock # Screen locker for Wayland
AddPackage udiskie # Removable disk automounter using udisks
AddPackage wl-clipboard
AddPackage xdg-desktop-portal # Desktop integration portals for sandboxed apps
AddPackage xdg-user-dirs
AddPackage --foreign autotiling-git
AddPackage --foreign clipman
AddPackage --foreign notify-send.sh # notify-send drop-in replacement with more features
AddPackage --foreign sway-launcher-desktop # TUI Application launcher with Desktop Entry support.
AddPackage --foreign waybar-git # Highly customizable Wayland bar for Sway and Wlroots based compositors
AddPackage --foreign wlsunset # Day/night gamma adjustments for Wayland compositors

AddPackage gnome-keyring # Stores passwords and encryption keys
CreateLink /etc/systemd/user/sockets.target.wants/gcr-ssh-agent.socket /usr/lib/systemd/user/gcr-ssh-agent.socket
CreateLink /etc/systemd/user/sockets.target.wants/gnome-keyring-daemon.socket /usr/lib/systemd/user/gnome-keyring-daemon.socket
CopyFile /etc/pam.d/login
CopyFile /etc/pam.d/passwd

CreateLink /etc/systemd/system/dbus-org.freedesktop.oom1.service /usr/lib/systemd/system/systemd-oomd.service
CreateLink /etc/systemd/system/multi-user.target.wants/systemd-oomd.service /usr/lib/systemd/system/systemd-oomd.service

#
# L&F
#
AddPackage capitaine-cursors # An x-cursor theme inspired by macOS and based on KDE Breeze
AddPackage --foreign qogir-gtk-theme-git # Qogir is a flat Design theme for GTK

#
# Apps
#
AddPackage alacritty
AddPackage chromium # A web browser built for speed, simplicity, and security
AddPackage evince
AddPackage firefox # Standalone web browser from mozilla.org
AddPackage foliate # A simple and modern GTK eBook reader
AddPackage gucharmap
AddPackage imv # Image viewer for Wayland and X11
AddPackage mpv # a free, open source, and cross-platform media player
AddPackage sane
AddPackage sane-airscan
AddPackage simple-scan
AddPackage vlc # Multi-platform MPEG, VCD/DVD, and DivX player

AddPackage code
AddPackage --foreign code-features
AddPackage --foreign code-marketplace

#
# System & dev tools
#

AddPackage btop # A monitor of system resources, bpytop ported to C++
AddPackage direnv # a shell extension that manages your environment
AddPackage exfatprogs # exFAT filesystem userspace utilities for the Linux Kernel exfat driver
AddPackage git # the fast distributed version control system
AddPackage jq # Command-line JSON processor
AddPackage man-db # A utility for reading man pages
AddPackage man-pages # Linux man pages
AddPackage ncdu # Disk usage analyzer with an ncurses interface
AddPackage neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs
AddPackage openssh # Premier connectivity tool for remote login with the SSH protocol
AddPackage tree # A directory listing program displaying a depth indented list of files
AddPackage unzip # For extracting and viewing files in .zip archives
AddPackage wget # Network utility to retrieve files from the Web
AddPackage zip # Compressor/archiver for creating and modifying zipfiles
AddPackage zsh # A very advanced and programmable command interpreter (shell) for UNIX
AddPackage --foreign rtx-bin # Polyglot runtime manager
AddPackage --foreign shellcheck-bin # Shell script analysis tool

# Language servers etc.
AddPackage lua-language-server
AddPackage stylua

# Containers
AddPackage docker # Pack, ship and run any application as a lightweight container
AddPackage docker-buildx # Docker CLI plugin for extended build capabilities with BuildKit
AddPackage docker-compose
AddPackage podman
AddPackage podman-compose
AddPackage --foreign dive-bin
