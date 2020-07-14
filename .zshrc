#!/bin/zsh

# Zsh Modules

autoload -Uz compinit
compinit

# Zsh style

zstyle ':completion:*:*:*:*:*' menu yes select

# Zsh Options

setopt interactivecomments

setopt prompt_subst

setopt complete_aliases

setopt auto_pushd
setopt pushd_minus
setopt pushd_ignore_dups

setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

# Zsh Plugins

. /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh || true

. /usr/local/opt/zsh-git-prompt/zshrc.sh && {
  ZSH_THEME_GIT_PROMPT_PREFIX="["
  ZSH_THEME_GIT_PROMPT_SUFFIX="]"
  ZSH_THEME_GIT_PROMPT_SEPARATOR=""

  ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
  ZSH_THEME_GIT_PROMPT_BEHIND=" %{↓%G%}"
  ZSH_THEME_GIT_PROMPT_AHEAD=" %{↑%G%}"

  ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[green]%}%{✚%G%}"
  ZSH_THEME_GIT_PROMPT_CHANGED=" %{$fg[blue]%}%{✚%G%}"
  ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}%{✖%G%}"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[magenta]%}?%{%G%}"

  ZSH_THEME_GIT_PROMPT_CLEAN=""
} || true

. /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh && {
  autoload -U history-substring-search-up
  autoload -U history-substring-search-down

  zle -N history-substring-search-up
  zle -N history-substring-search-down

  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

  bindkey '^P' history-substring-search-up
  bindkey '^N' history-substring-search-down
} || true

# Prompt

precmd () {
  STATUS=$?

  PROMPT="%F{red}%n %F{gray}%1~"

  [[ "$(pwd)" != "/" ]] && {
    PROMPT+="/ %f"
  } || {
    PROMPT+=" %f"
  }

  [[ $(git rev-parse --git-dir 2>/dev/null) ]] && \
    PROMPT+="$(git_super_status) "

  case ${STATUS} in
    "0" | "130")
      PROMPT+="%F{gray}> %f"
      ;;
    "1")
      PROMPT+="%F{red}> %f"
      ;;
    *)
      PROMPT+="%F{magenta}> %f"
      ;;
  esac

  unset STATUS
}

export PROMPT

# Aliases

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

alias cd-='cd -'
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

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias tree='tree -a -I ".git"'

alias code='code -r'
alias v='vim'

type nvim >/dev/null && {
  alias vim='nvim'
}

alias f='open -a Finder .'

# Functions
chpwd() {
  echo
  ls
  echo
}

cdf() {
  target=$(osascript -e \
    "tell application \"Finder\" to \
     if (count of Finder windows) > 0 then \
     get POSIX path of (target of front Finder window as text)")
  [[ -n "${target}" ]] && {
    cd "${target}"
    unset target
    return 0
  } || {
    echo "${0}: No finder window found"
    unset target
    return 1
  }
}

# Ctrl r

bindkey '^r' history-incremental-search-backward

# History

SAVEHIST=1000000
HISTSIZE=1000000
HISTFILE=~/.zsh_history

# Language settings

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Enviroment Variables

export DOTFILES=/Users/fraguinha/Github/dotfiles

# Scripts

[[ ! "${PATH}" == */usr/local/bin/scripts* ]] && \
  export PATH="${PATH:+${PATH}:}/usr/local/bin/scripts" || true

# Android

export ANDROID_SDK="${HOME}/Library/Android/sdk"

[[ ! "${PATH}" == *${ANDROID_SDK}/platform-tools* ]] && \
  export PATH="${PATH:+${PATH}:}${ANDROID_SDK}/platform-tools" || true

[[ ! "${PATH}" == *${ANDROID_SDK}/emulator* ]] && \
  export PATH="${PATH:+${PATH}:}${ANDROID_SDK}/emulator" || true

[[ ! "${PATH}" == *${ANDROID_SDK}/tools* ]] && \
  export PATH="${PATH:+${PATH}:}${ANDROID_SDK}/tools" || true

# Opam

test -r ${HOME}/.opam/opam-init/init.zsh && \
. ${HOME}/.opam/opam-init/init.zsh &> /dev/null || true
