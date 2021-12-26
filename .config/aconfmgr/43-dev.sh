AddPackage go # Core compiler tools for the Go programming language
AddPackage yq # Command-line YAML/XML processor - jq wrapper for YAML/XML documents

AddPackage poppler # PDF rendering library based on xpdf 3.0
AddPackage graphviz # Graph visualization software
AddPackage postgresql # Sophisticated object-relational DBMS
AddPackage --foreign 1password-cli

AddPackage --foreign aws-cli-v2-bin # Universal Command Line Interface for Amazon Web Services version 2
AddPackage --foreign aws-session-manager-plugin

# Perimeter81 :(
AddPackage xorg-xwayland
AddPackage --foreign perimeter81
IgnorePath /etc/wireguard/p81.conf
IgnorePath /usr/local/share/ca-certificates/perimeter81
