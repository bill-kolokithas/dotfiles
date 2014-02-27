#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export HISTCONTROL=ignoredups
complete -cf sudo

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias grep='grep --color=auto'
alias ..="cd .."
alias ...="cd ../../"
alias cleanaur="rm -rf ~/aur/*"
alias pushpac="find ~/aur -name '*pkg.tar*' -exec sudo repo-add /repo/x86_64/packages/custom.db.tar.gz {} + \
										    -exec sudo mv -t /repo/x86_64/packages/ {} + \
										    && sudo pacman -Syu --config /etc/pacman.d/custom-repo.conf"

export WINEARCH=win32
export WINEPREFIX=~/win32
export PATH=$PATH:/home/free/.gem/ruby/2.0.0/bin

