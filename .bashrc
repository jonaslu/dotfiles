#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -hal --color=auto'
alias cdiff='cdiff -w 0 -s'
alias rgrep='grep --color=always -r'
alias vi='vim'

PS1='[\u@\h \W]\$ '
export EDITOR=vim
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
source /usr/share/nvm/init-nvm.sh
stty -ixon
eval $(thefuck --alias)
