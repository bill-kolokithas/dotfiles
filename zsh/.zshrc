autoload -U promptinit && promptinit
autoload -U colors && colors
PROMPT="%{$fg[blue]%}[%T]%{$reset_color%} %n@%{$fg[cyan]%}%m%{$reset_color%} %1~ %# "
RPROMPT='%{$fg[magenta]%}${vcs_info_msg_0_}%{$reset_color%}'

function zle-line-init zle-keymap-select zle-line-finish {
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-finish

function TRAPINT() {
	zle && zle reset-prompt
	return $(( 128 + $1 ))
}

HISTFILE=~/.histfile
HISTSIZE=8000
SAVEHIST=8000
setopt append_history inc_append_history share_history
setopt hist_ignore_all_dups hist_ignore_space hist_verify

# git integration
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%c%u%b"
zstyle ':vcs_info:git*' stagedstr "✔ "
zstyle ':vcs_info:git*' unstagedstr "✘ "
precmd() { vcs_info; print -Pn "\e]0;Terminal\a" }
preexec () { print -Pn "\e]0;$1\a" }

zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit && compinit
setopt autocd prompt_subst extendedglob complete_aliases
setopt nohup longlistjobs notify

# Allow use of ctrl-s / ctrl-q
stty -ixon
stty icrnl

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:rm:*' ignore-line yes
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#) #(*)=0=01;31=01;36"
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,cmd'

[ -r ~/.ssh/known_hosts ] && _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}) || _ssh_hosts=()
hosts=(
	"$_ssh_hosts[@]"
	"$HOST"
	localhost
)
zstyle ':completion:*:hosts' hosts $hosts

################################# keybindings #################################
bindkey -e
typeset -A key

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
bindkey "^[m" copy-prev-shell-word
bindkey '\C-w' backward-kill-word

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-beginning-search
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-beginning-search
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

fancy-ctrl-z () {
	if [[ $#BUFFER -eq 0 ]]; then
		BUFFER="fg"
		zle accept-line
	else
		zle push-input
		zle clear-screen
	fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..="cd .."
alias ...="cd ../../"
alias vi='nvim'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias be='bundle exec'

loop() {
	for ((;;)) { "$@"; read; }
}

eval "$(rbenv init - zsh)"
eval "$(pyenv init -)"
source "$HOME/.asdf/asdf.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias yazi='~/Downloads/yazi-x86_64-unknown-linux-musl/yazi'

[[ -f ~/.zsh_aliases_private ]] && source ~/.zsh_aliases_private
