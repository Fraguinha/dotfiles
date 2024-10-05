# Bootstrap Zinit
ZI_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zi/zi.git"

[ ! -d $ZI_HOME ] && mkdir -p "$(dirname $ZI_HOME)"
[ ! -d $ZI_HOME/.git ] && git clone --depth=1 git@github.com:z-shell/zi.git "$ZI_HOME"

source "${ZI_HOME}/zi.zsh"

# Load completions
autoload -Uz compinit
compinit

# Completion plugins
zi light zsh-users/zsh-completions
zi light zsh-users/zsh-autosuggestions
zi light z-shell/zsh-fancy-completions

bindkey '\t' menu-select
bindkey "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete

# History search plugin
zi light fraguinha/H-S-MW

zstyle ":history-search-multi-word" highlight-color "fg=yellow"
zstyle ":history-search-multi-word" background-color ""
zstyle ":plugin:history-search-multi-word" active "bold,underline"

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[OA' history-search-backward
bindkey '^[OB' history-search-forward

# Auto pair plugin
zi light hlissner/zsh-autopair

# Syntax highlighting plugin
zle -N menu-search
zle -N recent-paths
zle -N insert-unambiguous-or-complete

zi light z-shell/F-Sy-H

# Colors plugin
zi pack for ls_colors

# Prompt plugin
zi ice \
    as"command" from"gh-r" \
    atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
    atpull"%atclone" src"init.zsh"
zi light starship/starship

# Emacs mode
bindkey -e

# History configuration
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=${HISTSIZE}
setopt inc_append_history
setopt hist_ignore_space
setopt hist_reduce_blanks

# No sound
setopt no_beep

# functions
source "$HOME/.functions.zsh"

# aliases
source "$HOME/.aliases.zsh"

# variables
source "$HOME/.variables.zsh"

# XDG Config
export XDG_CONFIG_HOME=$HOME/.config

# SSH Agent
eval $(ssh-agent -s) &>/dev/null
ssh-add --apple-use-keychain "$HOME/.ssh/id_rsa" &>/dev/null

# java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# go
export GVM_DIR="$HOME/.gvm"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# javascript
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# rust
[[ ! -r "$HOME/.cargo/env" ]] || source "$HOME/.cargo/env"  > /dev/null 2> /dev/null

# ocaml
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh"  > /dev/null 2> /dev/null
