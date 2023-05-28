function WriteHostsFile() {
    local hostname="$1"
    cat <<EOF >> "$(GetPackageOriginalFile filesystem /etc/hosts)"
127.0.0.1	localhost
::1         localhost
127.0.1.1	${hostname}.localdomain	${hostname}
EOF
}

function ConfigureMakepkg() {
    sed -i "/MAKEFLAGS=/c\MAKEFLAGS=\"-j$(nproc)\"" "$(GetPackageOriginalFile pacman /etc/makepkg.conf)"
}

function CopyHostSpecificFile() {
    CopyFileTo "${1}@${HOSTNAME}" "$1"
}
