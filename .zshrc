# functions
source "$HOME/.functions.zsh"

# aliases
source "$HOME/.aliases.zsh"

# variables
source "$HOME/.variables.zsh"

# ocaml
eval $(opam env)

# rust
source "$HOME/.cargo/env"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# syntax highlighting
source /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# auto complete
source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
zstyle ':autocomplete:*history*:*' insert-unambiguous yes
zstyle ':autocomplete:menu-search:*' insert-unambiguous yes

# auto suggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# auto pair
source /usr/local/share/zsh-autopair/autopair.zsh

# starship
eval "$(starship init zsh)"
