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

alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../..'
alias .7='cd ../../../../../../..'
alias .8='cd ../../../../../../../..'
alias .9='cd ../../../../../../../../..'

alias f='open -a Finder .'

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias python='/usr/local/bin/python3'
alias pip='/usr/local/bin/pip3'

alias ubuntu='docker run --rm -it -v "$PWD":"/mnt/$PWD" -w "/mnt/$PWD" ubuntu:latest'
alias ubuntu32='docker run --rm -it -v "$PWD":"/mnt/$PWD" -w "/mnt/$PWD" i386/ubuntu:latest'

alias tree='tree -a -I ".git"'

alias code='code -r'
