ZSH_DISABLE_COMPFIX="true"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000

# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git kubectl gitignore z zsh-syntax-highlighting zsh-autosuggestions)

# Load aliases and shortcuts if existent.
[ -f "$HOME/.my-config/.shortcutrc" ] && source "$HOME/.my-config/.shortcutrc"
[ -f "$HOME/.my-config/.aliasrc" ] && source "$HOME/.my-config/.aliasrc"

unsetopt BG_NICE

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

