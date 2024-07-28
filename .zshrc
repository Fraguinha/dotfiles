# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Syntax Highlighting
source /home/linuxbrew/.linuxbrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Completions
fpath=("$(brew --prefix)/share/zsh-functions" $fpath)
autoload -Uz compinit
compinit

source /home/linuxbrew/.linuxbrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

source /home/linuxbrew/.linuxbrew/share/zsh-autopair/autopair.zsh

# SSH
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# History
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zsh_history
setopt SHARE_HISTORY

# starship
eval "$(starship init zsh)"

# functions
source "$HOME/.functions.zsh"

# aliases
source "$HOME/.aliases.zsh"

# variables
source "$HOME/.variables.zsh"

# java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# javascript
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# rust
[[ ! -r "$HOME/.cargo/env" ]] || source "$HOME/.cargo/env"  > /dev/null 2> /dev/null

# ocaml
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh"  > /dev/null 2> /dev/null
