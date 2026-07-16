KEYTIMEOUT=1

bindkey '^[[A' up-line-or-history
bindkey '^[[B' down-line-or-history
bindkey '^[[C' forward-char
bindkey '^[[D' backward-char

bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^R' history-incremental-search-backward

export CODESTRAL_API_KEY="$MISTRAL_API_KEY";

function show() {
    local source="${1:-.}"
    shift

    local pattern="${${@:+((${(j:|:)@}))}:-*}"

    local f
    for f in $source/**/*.$~pattern(N.); do
        echo "\`\`\`${f##*.}"
        cat "$f"
        echo "\`\`\`\n"
    done
}
