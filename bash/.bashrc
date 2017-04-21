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
alias less='less -R'

export PS1="\[\e[34m\]\w\[\e[m\] \[\e[32m\]\t\[\e[m\] \h\n\$ "
export EDITOR=vim
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
source /usr/share/nvm/init-nvm.sh
stty -ixon
eval $(thefuck --alias)

[ -f ~/.bashrc_local ] && source ~/.bashrc_local
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi
