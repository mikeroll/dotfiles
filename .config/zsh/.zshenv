
export LANG=en_US.UTF-8

# Setup temp dir
export TMPDIR="/tmp/${USER}"
if [[ ! -d "$TMPDIR" ]]; then
  mkdir -p "$TMPDIR"
fi
TMPPREFIX="${TMPDIR%/}/zsh"

source $ZDOTDIR/path.zsh
source $ZDOTDIR/xdghacks.zsh
source $ZDOTDIR/apptweaks.zsh
