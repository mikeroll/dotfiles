#
# DE
#
AddPackage dex # Program to generate and execute DesktopEntry files of type Application
AddPackage grim
AddPackage kanshi
AddPackage libnotify # Library for sending desktop notifications
AddPackage lxsession-gtk3 # Lightweight X11 session manager (GTK+ 3 version)
AddPackage mako # Lightweight notification daemon for Wayland
AddPackage slurp
AddPackage swappy # A Wayland native snapshot editing tool
AddPackage sway
AddPackage swayidle # Idle management daemon for Wayland
AddPackage swaylock # Screen locker for Wayland
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
AddPackage firefox # Standalone web browser from mozilla.org
AddPackage foliate # A simple and modern GTK eBook reader
AddPackage imv # Image viewer for Wayland and X11
AddPackage transmission-gtk # Fast, easy, and free BitTorrent client (GTK+ GUI)
AddPackage --foreign visual-studio-code-bin # Visual Studio Code (vscode): Editor for building and debugging modern web and cloud applications (official binary version)


#
# Dev tools
#
AddPackage git # the fast distributed version control system
AddPackage jq # Command-line JSON processor
AddPackage neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs
AddPackage man-db # A utility for reading man pages
AddPackage man-pages # Linux man pages
AddPackage htop # Interactive process viewer
AddPackage zsh # A very advanced and programmable command interpreter (shell) for UNIX
AddPackage ncdu # Disk usage analyzer with an ncurses interface
AddPackage openssh # Premier connectivity tool for remote login with the SSH protocol
AddPackage tree # A directory listing program displaying a depth indented list of files
AddPackage shellcheck # Shell script analysis tool
AddPackage unzip # For extracting and viewing files in .zip archives
AddPackage wget # Network utility to retrieve files from the Web
AddPackage zip # Compressor/archiver for creating and modifying zipfiles
AddPackage --foreign direnv-bin # a shell extension that manages your environment
AddPackage --foreign asdf-vm # Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more

AddPackage docker # Pack, ship and run any application as a lightweight container

AddPackage qmk
