# functions
source "$HOME/.functions.zsh"

# aliases
source "$HOME/.aliases.zsh"

# variables
source "$HOME/.variables.zsh"

# ocaml
eval $(opam env)

# starship
eval "$(starship init zsh)"
