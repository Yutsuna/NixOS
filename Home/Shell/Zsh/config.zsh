KEYTIMEOUT=1

bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history
bindkey '^[[C' forward-char
bindkey '^[[D' backward-char

bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^R' history-incremental-search-backward

export DIRENV_LOG_FORMAT=""
