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
alias use_python2="export PATH=~/bin/python2:${PATH}"
alias jsPretty='python -m json.tool'
alias diff='diff --color'

export PS1="\[\e[34m\]\w\[\e[m\] \[\e[32m\]\t\[\e[m\] \h\n\$ "
export EDITOR=vim

shopt -s histappend
export HISTTIMEFORMAT="%d/%m/%y %T "

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
source /usr/share/nvm/init-nvm.sh
stty -ixon
eval $(thefuck --alias)

[ -f ~/.bashrc_local ] && source ~/.bashrc_local
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

if command -v npm>/dev/null; then
  source <(npm completion)
fi

LESSOPEN="|/usr/bin/lesspipe.sh %s"; export LESSOPEN
