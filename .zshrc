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

# auto suggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# history
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# auto pair
source /usr/local/share/zsh-autopair/autopair.zsh

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=''
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# starship
eval "$(starship init zsh)"
