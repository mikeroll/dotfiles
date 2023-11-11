AddPackage aws-cli-v2 # Unified command line interface for Amazon Web Services (version 2)
AddPackage btop # A monitor of system resources, bpytop ported to C++
AddPackage direnv # a shell extension that manages your environment
AddPackage docker # Pack, ship and run any application as a lightweight container
AddPackage docker-buildx # Docker CLI plugin for extended build capabilities with BuildKit
AddPackage docker-compose
AddPackage git # the fast distributed version control system
AddPackage helix # A post-modern modal text editor
AddPackage jq # Command-line JSON processor
AddPackage k9s
AddPackage lazygit # Simple terminal UI for git commands
AddPackage lua-language-server
AddPackage man-db # A utility for reading man pages
AddPackage man-pages # Linux man pages
AddPackage neovim # Fork of Vim aiming to improve user experience, plugins, and GUIs
AddPackage openssh # Premier connectivity tool for remote login with the SSH protocol
AddPackage stylua
AddPackage tree # A directory listing program displaying a depth indented list of files
AddPackage unzip # For extracting and viewing files in .zip archives
AddPackage wget # Network utility to retrieve files from the Web
AddPackage yq # Command-line YAML/XML processor - jq wrapper for YAML/XML documents
AddPackage zip # Compressor/archiver for creating and modifying zipfiles
AddPackage zsh # A very advanced and programmable command interpreter (shell) for UNIX
AddPackage --foreign aws-session-manager-plugin
AddPackage --foreign dive-bin
AddPackage --foreign rtx-bin # Polyglot runtime manager
AddPackage --foreign shellcheck-bin # Shell script analysis tool
AddPackage --foreign terraform-ls-bin # Terraform Language Server

case "${HOSTNAME}" in
dumpster)
    AddPackage poppler # PDF rendering library based on xpdf 3.0
    AddPackage graphviz # Graph visualization software
    AddPackage postgresql # Sophisticated object-relational DBMS
    AddPackage github-cli
    AddPackage cloudflared
    ;;
esac
