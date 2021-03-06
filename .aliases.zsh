alias mkdir='mkdir -p'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias l='dirs -v'

alias l0='cd -0'
alias l1='cd -1'
alias l2='cd -2'
alias l3='cd -3'
alias l4='cd -4'
alias l5='cd -5'
alias l6='cd -6'
alias l7='cd -7'
alias l8='cd -8'
alias l9='cd -9'

alias ls='ls -Gv'
alias ll='ls -lh'
alias la='ls -lhA'
alias l.='ls -lhd .*'

alias cd.='cd .'
alias cd..='cd ..'

alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias .7='cd ../../../../../../..'
alias .8='cd ../../../../../../../..'
alias .9='cd ../../../../../../../../..'

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias tree='tree -a -I ".git"'

alias code='code -r'
alias vim='nvim'
alias v='vim'

type nvim >/dev/null && {
  alias vim='nvim'
}

alias f='open -a Finder .'
