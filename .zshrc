ZSH_DISABLE_COMPFIX="true"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000

ZSH_THEME="agnoster"


#CUSTOM SPACESHIP OVERRIDE
# SPACESHIP_PROMPT_ORDER=(
#     time          # Time stampts section
#     node          # Node.js section
#     user          # Username section
#     dir           # Current directory section
#     host          # Hostname section
#     git           # Git section (git_branch + git_status)
#     package       # Package version
    
    # docker        # Docker section
    # aws           # Amazon Web Services section
    # gcloud        # Google Cloud Platform section
    # pyenv         # Pyenv section

    # dotnet        # .NET section
    # kubectl       # Kubectl context section

#     exec_time     # Execution time
#     line_sep      # Line break
    #vi_mode       # Vi-mode indicator

    # jobs          # Background jobs indicator
    
#     exit_code     # Exit code section
#     char          # Prompt character
# )

# SPACESHIP_PROMPT_ORDER=(
#   time     #
#   vi_mode  # these sections will be
#   user     # before prompt char
#   host     #
#   char
#   dir
#   git
#   node
#   docker
#   venv
#   pyenv
# )

# # USER
# SPACESHIP_USER_PREFIX="" # remove `with` before username
# SPACESHIP_USER_SUFFIX="" # remove space before host

# # HOST
# # Result will look like this:
# #   username@:(hostname)
# SPACESHIP_HOST_PREFIX="@:("
# SPACESHIP_HOST_SUFFIX=") "

# # DIR
# SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section
# SPACESHIP_DIR_TRUNC='1' # show only last directory

# # GIT
# # Disable git symbol
# SPACESHIP_GIT_SYMBOL="" # disable git prefix
# SPACESHIP_GIT_BRANCH_PREFIX="" # disable branch prefix too
# # Wrap git in `git:(...)`
# SPACESHIP_GIT_PREFIX='git:('
# SPACESHIP_GIT_SUFFIX=") "
# SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name
# # Unwrap git status from `[...]`
# SPACESHIP_GIT_STATUS_PREFIX=""
# SPACESHIP_GIT_STATUS_SUFFIX=""

# # NODE
# SPACESHIP_NODE_PREFIX="node:("
# SPACESHIP_NODE_SUFFIX=") "
# SPACESHIP_NODE_SYMBOL=""

# # DOCKER
# SPACESHIP_DOCKER_PREFIX="docker:("
# SPACESHIP_DOCKER_SUFFIX=") "
# SPACESHIP_DOCKER_SYMBOL=""

# # VENV
# SPACESHIP_VENV_PREFIX="venv:("
# SPACESHIP_VENV_SUFFIX=") "

# # PYENV
# SPACESHIP_PYENV_PREFIX="python:("
# SPACESHIP_PYENV_SUFFIX=") "
# SPACESHIP_PYENV_SYMBOL=""

plugins=(git z zsh-syntax-highlighting zsh-autosuggestions)
#plugins=(git vi-mode autojump zsh-syntax-highlighting zsh-autosuggestions)

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/.shortcutrc" ] && source "$HOME/.config/.shortcutrc"
[ -f "$HOME/.config/.aliasrc" ] && source "$HOME/.config/.aliasrc"

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

export DOCKER_HOST=tcp://localhost:2375
