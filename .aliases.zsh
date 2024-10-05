alias grep='grep --color=auto'

alias ls='ls -v -G --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias l.='ls -lhd .*'

alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'

alias tree='tree -a -I ".git"'

alias gemini="GEMINI_API_KEY=$(pass google/gemini) gemini"

alias code='code -r'
alias vim='nvim'

alias f='open -a Finder .'
