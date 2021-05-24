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
AddPackage xorg-xwayland


#
# L&F
#
AddPackage capitaine-cursors # An x-cursor theme inspired by macOS and based on KDE Breeze
AddPackage --foreign lounge-gtk-theme-git # Simple and clean theme, based on original Adwaita


#
# Apps
#
AddPackage alacritty
AddPackage code # The Open Source build of Visual Studio Code (vscode) editor
AddPackage firefox # Standalone web browser from mozilla.org


#
# Dev tools
#
AddPackage git # the fast distributed version control system
AddPackage neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs
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
