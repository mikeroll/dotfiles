function CopyFile() {
	local file="$1"
	local mode="${2:-}"
	local owner="${3:-}"
	local group="${4:-}"

    # if a host-specific file exists, use that as the source instead
    local srcfile
    if [[ -f "$config_dir/files/@${HOSTNAME}/${file}" ]]; then 
		srcfile="/@${HOSTNAME}${file}"
	else
		srcfile="$file"
	fi

	CopyFileTo "$srcfile" "$file" "$mode" "$owner" "$group"
}
