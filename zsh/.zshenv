typeset -U path
path=(
	~/bin
	$path
  ~/.rbenv/bin
  ~/.pyenv/bin
  ~/.asdf/shims
)

export XDG_CONFIG_HOME=~/.config
export DISABLE_SPRING=1
export EDITOR=nvim
export VISUAL=nvim
export COLORTERM=truecolor
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export WORDCHARS=$WORDCHARS:
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$UID/bus
export MEMCACHED_URI='127.0.0.1:11211'
export AWS_PROFILE=PROD_Yogurt
