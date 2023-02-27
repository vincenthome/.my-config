ZSH_DISABLE_COMPFIX="true"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000

# LOCAL Environment Variables
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(poetry virtualenv z zsh-syntax-highlighting zsh-autosuggestions dirhistory history web-search sudo emoji vscode git gitignore docker docker-compose zsh-docker-aliases kubectl)

# GLOBAL Environment Variables
# Git Credential Setup
export GCM_CREDENTIAL_STORE=cache
export GCM_CREDENTIAL_CACHE_OPTIONS="--timeout 64800"

# Load aliases and shortcuts if existent.
[ -f "$HOME/.my-config/.shortcutrc" ] && source "$HOME/.my-config/.shortcutrc"
[ -f "$HOME/.my-config/.aliasrc" ] && source "$HOME/.my-config/.aliasrc"
[ -f "$HOME/.my-config/.immaliasrc" ] && source "$HOME/.my-config/.immaliasrc"

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

