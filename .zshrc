# Reload zshrc
# source ~/.zshrc

export EDITOR="vim"
bindkey -v 
export KEYTIMEOUT=1

## vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward 

# tmux assume 256 colors
alias tmux="tmux -2"

# Use colors by their names
autoload -U colors
colors

##### RIGHT PROMPT #####
# Setup
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

# Show staged and unstaged files
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%{%B$fg[red]%}%b%{$reset_color%} %{$fg[red]%}%m%u%c%{$reset_color%}$del"
precmd() {
    vcs_info
}
RPROMPT='${vcs_info_msg_0_}'

##### LEFT PROMPT #####
local host_name="%{$fg[cyan]%}$HOST"
local path_string="%{$fg[yellow]%}%1d"
local prompt_string="»"

# Make prompt_string red if the previous command failed.
local return_status="%(?:%{$fg[blue]%}$prompt_string:%{$fg[red]%}$prompt_string)"
PROMPT='${host_name} ${path_string} ${return_status} %{$reset_color%}'

# Git completion
zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash

# Tab with highlight through completion options
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit && compinit
zmodload -i zsh/complist
zstyle ':completion:*' menu select

# Save lots of (unique) history
export HISTSIZE=10000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# Share history across sessions
setopt inc_append_history
setopt sharehistory

