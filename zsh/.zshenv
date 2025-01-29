typeset -U path
path=(
	~/bin
	$path
	$GOPATH/bin
  ~/.rbenv/bin
  ~/.pyenv/bin
)

export XDG_CONFIG_HOME=~/.config
export GOPATH=~/programming/go
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")
export DISABLE_SPRING=1
export EDITOR=nvim
export VISUAL=nvim
export TERMCOLOR=rxvt-unicode-256color
export COLORTERM=truecolor
export LIBVA_DRIVER_NAME=iHD
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export WORDCHARS=$WORDCHARS:
export VIMRUNTIME=~/Downloads/nvim-linux-x86_64/share/nvim/runtime
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$UID/bus
export MEMCACHED_URI='127.0.0.1:11211'
