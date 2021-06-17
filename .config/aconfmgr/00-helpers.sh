function WriteHostsFile() {
    local hostname="$1"
    local file="$(GetPackageOriginalFile filesystem /etc/hosts)"
    cat <<EOF >> "${file}"
127.0.0.1	localhost
::1         localhost
127.0.1.1	${hostname}.localdomain	${hostname}
EOF
}

function ConfigureMakepkg() {
    local file="$(GetPackageOriginalFile pacman /etc/makepkg.conf)"
    sed -i "/MAKEFLAGS=/c\MAKEFLAGS=\"-j$(nproc)\"" "${file}"
}

function CopyHostSpecificFile() {
    CopyFileTo "${1}@${HOSTNAME}" "$1"
}
