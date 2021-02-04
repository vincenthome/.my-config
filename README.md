# Install and switch to zsh

- Via Package Manager: `apt install zsh`
- Verify installation by running `zsh --version`
- Make it your default shell: `chsh -s $(which zsh)`

# Install oh-my-zsh

- curl: `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- wget: `sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"`

# Install .config

- Clone: `git clone https://github.com/vincenthome/.config.git ~/.config`
- edit ~/.zshrc: 
  - add near front `[ -f "$HOME/.config/.zshrc" ] && source "$HOME/.config/.zshrc"` 
  - add near bottom 
    ```
    #### Load aliases and shortcuts if existent. MUST RUN AFTER oh-my-zsh.sh
    [ -f "$HOME/.config/.shortcutrc" ] && source "$HOME/.config/.shortcutrc"
    [ -f "$HOME/.config/.aliasrc" ] && source "$HOME/.config/.aliasrc"

    autoload -U colors && colors
    unset LS_COLORS;
    LS_COLORS='rs=0:di=01;35;40:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=$export LS_COLORS

    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    export CLICOLOR=1
    export CLICOLOR_FORCE=1
    ```
  




## Custom Theme, Plugin

Install them here:

```
~/.oh-my-zsh/custom/plugins
~/.oh-my-zsh/custom/theme
```

Activate them

```
plugins=(zsh-autosuggestions)
ZSH_THEME="agnoster"
```  

### Popular Themes

- `agnoster`
- `spaceship`
  - `git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1`
  - Symlink `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"`
  - Set `ZSH_THEME="spaceship"` in your .zshrc

### Popular Plugins

- `cloudapp` – uploads files and piped contents to the Cloudapp service. Outputs and copies the resultant URL to the clipboard.
- `command-not-found` – if a command is not recognized in the $PATH, this will use Ubuntu’s command-not-found package to find it or suggest spelling mistakes (Only for Ubuntu and openSUSE).
- `git`
- `node` – open the Node API, for your current version, in your browser.
- `npm` – adds autocompletion to npm.
- `sudo` – hitting ESC twice puts sudo in front of the current command, or the last one if the command line is empty.
- `vscode` – makes interaction between the command line and the code editor easier.
- `zsh-autosuggestions`
- `zsh-syntax-highlighting`
- `lf`
- `autojump`

## Directory

- Skip `cd`
- `..` `...` `....` `.....` to move up x directories
- `/` `~`
- `take` Create a new directory and change to it
- `rd`
- partialDirectory `TAB` / some path `TAB`
- `z` from most frequent diretory list


## Git

- Command Lookup e.g. `git a` + `TAB`

- plugins=(git)

- alias for multiple commands:
```
function acp() {
  git add .
  git commit -m "$1"
  git push
}
```

## Misc

- `x` Extract an archive
- `alias` list all aliases
- `zsh_stats` Get a list of the top 20 commands and how many times they have been run.
- `uninstall_oh_my_zsh`
- `omz update` Upgrade Oh-my-zsh
- `ls -(tab)
- `ssh (tab)`
- `unrar (tab)`

## Fonts
p.s. In WSL, if we are seeing broken characters in terminal, as soon as installed Oh My Zsh. To remedy this we need to install the Powerline fonts and tell our terminal to use them. fira-code-nerdfont

```
git clone https://github.com/powerline/fonts.git
```

Then open an admin PowerShell, navigate to the root of the repo and run:

```
.\install.ps1
```

If PowerShell blocks you from running the script, then try setting the ExecutionPolicy as per this [https://stackoverflow.com/questions/4037939/powershell-says-execution-of-scripts-is-disabled-on-this-system/4038991#4038991](https://stackoverflow.com/questions/4037939/powershell-says-execution-of-scripts-is-disabled-on-this-system/4038991#4038991)

Finally, right click on the terminal’s title bar, choose Properties > Font and make sure a Powerline font is selected. In testing, Deja Vu Sans Mono for Powerline.

## GNU find

- File:  find dir -name filename // '.' current dir 
- wildcard * must enclosed w/ quote ' test*.* 
- Dir: find . -type d dirname
- cheatsheet - https://bencane.com/2012/07/22/cheat-sheet-21-useful-find-commands/ 
- grep word filename
 - … | less  // keystroke: 'b' back / 'spacebar' forward / 'q' quit


## Tips and Tricks

[https://www.sitepoint.com/zsh-tips-tricks/](https://www.sitepoint.com/zsh-tips-tricks/)

## Install Nodejs

### Ubuntu

```
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
```

[https://github.com/nodesource/distributions/blob/master/README.md#debinstall](https://github.com/nodesource/distributions/blob/master/README.md#debinstall)
