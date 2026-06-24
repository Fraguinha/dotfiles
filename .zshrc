# ─── Plugins ─────────────────────────────────────────────────────────────────

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

antidote load

# ─── Completion ───────────────────────────────────────────────────────────────

fpath=(
  /opt/homebrew/share/zsh/site-functions
  $fpath
)

setopt complete_in_word
setopt always_to_end
setopt auto_menu
setopt auto_list
setopt auto_param_slash
setopt path_dirs
setopt extended_glob
unsetopt menu_complete
unsetopt flow_control

zmodload zsh/complist

zstyle ':completion:*' completer _complete _ignored _correct _approximate _files
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions"
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

zstyle ':completion:*'              format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages'     format ' %F{purple}-- %d --%f'
zstyle ':completion:*:warnings'     format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:corrections'  format ' %F{green}-- %d (errors: %e) --%f'

zstyle ':completion:*:approximate:*' max-errors 2 numeric

zstyle ':completion:*:*:cd:*'                 tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*'              group-order 'named-directories' 'path-directories' 'users' 'expand'

zstyle ':completion:*:*:*:*:processes'          command 'ps -u $USER -o pid,user,comm -w'
zstyle ':completion:*:*:kill:*:processes'       list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:(kill|killall|pkill):*' menu yes select force-list always insert-ids single

zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*'             file-patterns '*:all-files'

zstyle ':completion:*:manuals'   separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true

zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|TRAP*)'
zstyle '*' single-ignored show

zstyle ':completion:*:git-checkout:*' sort false

zstyle ":history-search-multi-word" highlight-color "fg=yellow,bold"
zstyle ":history-search-multi-word" background-color ""
zstyle ":plugin:history-search-multi-word" active "fg=cyan,bold,underline"

autoload -Uz compinit && compinit -i -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/completions"
autoload -U +X bashcompinit && bashcompinit

# ─── Key Bindings ─────────────────────────────────────────────────────────────

bindkey -e

WORDCHARS=''

zmodload zsh/terminfo
bindkey '\t' menu-select
[[ -n "$terminfo[kcbt]" ]] && bindkey "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete
[[ -n "$terminfo[kcbt]" ]] && bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete

[[ -n "$terminfo[kdch1]" ]] && bindkey "$terminfo[kdch1]" delete-char        || bindkey '^[[3~' delete-char
[[ -n "$terminfo[khome]" ]] && bindkey "$terminfo[khome]" beginning-of-line  || bindkey '^[[H'  beginning-of-line
[[ -n "$terminfo[kend]"  ]] && bindkey "$terminfo[kend]"  end-of-line        || bindkey '^[[F'  end-of-line

bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
bindkey '^[^[[D'  backward-word
bindkey '^[^[[C'  forward-word

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[OA' history-search-backward
bindkey '^[OB' history-search-forward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ─── History ──────────────────────────────────────────────────────────────────

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=1000000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# ─── Shell Options ────────────────────────────────────────────────────────────

setopt no_beep

# ─── SSH ──────────────────────────────────────────────────────────────────────

if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)" > /dev/null
  ssh-add --apple-load-keychain 2>/dev/null
fi

# ─── Aliases ──────────────────────────────────────────────────────────────────

[[ -s "$HOME/.aliases.zsh" ]] && source "$HOME/.aliases.zsh"

# ─── Functions ────────────────────────────────────────────────────────────────

[[ -s "$HOME/.functions.zsh" ]] && source "$HOME/.functions.zsh"

# ─── Environment & Tools ──────────────────────────────────────────────────────

export PATH="$HOME/.local/bin:$PATH"
export MANPATH="/opt/homebrew/share/man:$MANPATH"
export XDG_CONFIG_HOME="$HOME/.config"

CDPATH=":$HOME"

# java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# go

# javascript
eval "$(fnm env --use-on-cd --shell zsh)"

# rust
[[ -r "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# ocaml
[[ -r "$HOME/.opam/opam-init/init.zsh" ]] && source "$HOME/.opam/opam-init/init.zsh"

# ─── Prompt ───────────────────────────────────────────────────────────────────

eval "$(starship init zsh)"
