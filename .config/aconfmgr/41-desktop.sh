#
# Login manager
#
AddPackage --foreign greetd # Generic greeter daemon
AddPackage --foreign greetd-tuigreet # A console UI greeter for greetd
CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/greetd.service
CopyFile /etc/greetd/config.toml


#
# GUI
#
AddPackage sway
AddPackage swayidle # Idle management daemon for Wayland
AddPackage swaylock # Screen locker for Wayland
AddPackage waybar # Highly customizable Wayland bar for Sway and Wlroots based compositors
AddPackage xorg-xwayland
AddPackage libnotify # Library for sending desktop notifications
AddPackage mako # Lightweight notification daemon for Wayland
AddPackage gnome-keyring # Stores passwords and encryption keys
AddPackage --foreign i3ipc-python-git # An improved Python library to control i3wm
AddPackage --foreign notify-send.sh # notify-send drop-in replacement with more features
AddPackage --foreign polkit-dumb-agent-git # A polkit agent in 145 lines of code using Qt and libsystemd, because polkit sucks.
AddPackage --foreign sway-launcher-desktop # TUI Application launcher with Desktop Entry support.
AddPackage --foreign wlsunset # Day/night gamma adjustments for Wayland compositors


#
# L&F
#
AddPackage capitaine-cursors # An x-cursor theme inspired by macOS and based on KDE Breeze
AddPackage --foreign qogir-gtk-theme # Qogir is a flat Design theme for GTK


#
# Apps
#
AddPackage alacritty
AddPackage chromium # A web browser built for speed, simplicity, and security
AddPackage code # The Open Source build of Visual Studio Code (vscode) editor
AddPackage firefox # Standalone web browser from mozilla.org


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
AddPackage --foreign direnv-bin # a shell extension that manages your environment
AddPackage --foreign asdf-vm # Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more

AddPackage docker # Pack, ship and run any application as a lightweight container
CopyFile /etc/docker/daemon.json
CopyFile /etc/docker/key.json 600
CreateLink /etc/systemd/system/multi-user.target.wants/docker.service /usr/lib/systemd/system/docker.service
