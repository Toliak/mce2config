#ZSH_FZF_HISTORY_SEARCH_FZF_EXTRA_ARGS='--height=30% --layout=reverse --border=none --info=hidden --no-separator'
# --color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'

# TODO: see https://github.com/junegunn/fzf/discussions/4188 to rework without temp file

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height=30% --layout=reverse --prompt='> ' --pointer='▶' --color='pointer:cyan' --border=none --no-separator --extended "
export FZF_CTRL_R_OPTS="--bind 'esc:abort' --prompt='Search > ' --height=8"

export ZSH_SESSION_ID="$RANDOM"

fzf-patch-history-widget() {
    SESFILE="/tmp/zsh-hist-$ZSH_SESSION_ID"
    rm -f "$SESFILE"
    FZF_CTRL_R_OPTS="$FZF_CTRL_R_OPTS --bind 'enter:transform:echo FIRE > \"$SESFILE\"; echo accept' --bind 'right:accept' --bind 'esc:print-query'"
    fzf-history-widget
    if [ -f "$SESFILE" ] && [ "$(cat "$SESFILE")" = "FIRE" ]; then
        zle accept-line
    fi
}
zle -N fzf-patch-history-widget
bindkey -M emacs '^R' fzf-patch-history-widget
bindkey -M vicmd '^R' fzf-patch-history-widget
bindkey -M viins '^R' fzf-patch-history-widget
