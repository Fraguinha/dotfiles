# Prompt
eval "$(starship init bash)"

# Aliases
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'

alias ls='ls -v -G --color=auto'
alias ll='ls -lh'
alias la='ls -lhA'
alias l.='ls -lhd .*'

alias tree='tree -a -I ".git"'

alias vim='neovim'
neovim() {
	if [[ $(nvim --version) ]]; then
    nvim "$@"
  else
    vim "$@"
  fi
}

# java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# go
export GVM_DIR="$HOME/.gvm"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# javascript
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# rust
export CARGO_DIR="$HOME/.cargo"
[[ ! -r "$CARGO_DIR/env" ]] || source "$CARGO_DIR/env"  > /dev/null 2> /dev/null

# ocaml
export OPAM_DIR="$HOME/.opam"
[[ ! -r "$OPAM_DIR/opam-init/init.zsh" ]] || source "$OPAM_DIR/opam-init/init.zsh"  > /dev/null 2> /dev/null
