# Install .ssh

- priviate key: `id_rsa`
- public key: `id_rsa.pub`
- known host?
- If get error about Permission for private key `id_rsa` too open, run `chmod 400 ~/.ssh/id_rsa`

# Install and switch to zsh

- Via Package Manager: `apt install zsh`
- Verify installation by running `zsh --version`
- Make it your default shell: `chsh -s $(which zsh)`

# Install oh-my-zsh

- `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

# Install .config

- Clone: `git clone https://github.com/vincenthome/.config.git ~/.config`
- edit ~/.zshrc: 
  - add near front `[ -f "$HOME/.config/.zshrc" ] && source "$HOME/.config/.zshrc"` 
  - add near bottom 
  
    ```
    # Load aliases and shortcuts if existent. MUST RUN AFTER oh-my-zsh.sh
    [ -f "$HOME/.config/.shortcutrc" ] && source "$HOME/.config/.shortcutrc"
    [ -f "$HOME/.config/.aliasrc" ] && source "$HOME/.config/.aliasrc"

    autoload -U colors && colors
    unset LS_COLORS;
    LS_COLORS='rs=0:di=01;35;40:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
    export LS_COLORS

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
plugins=(git z zsh-autosuggestions)
ZSH_THEME="agnoster"
```  

### Popular Themes

- `agnoster`
- `spaceship`
  - `git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1`
  - Symlink `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"`
  - Set `ZSH_THEME="spaceship"` in your .zshrc

### Popular Plugins

- `autojump`
- `cloudapp` – uploads files and piped contents to the Cloudapp service. Outputs and copies the resultant URL to the clipboard.
- `command-not-found` – if a command is not recognized in the $PATH, this will use Ubuntu’s command-not-found package to find it or suggest spelling mistakes (Only for Ubuntu and openSUSE).
- `git`
- `lf`
- `node` – open the Node API, for your current version, in your browser.
- `npm` – adds autocompletion to npm.
- `sudo` – hitting ESC twice puts sudo in front of the current command, or the last one if the command line is empty.
- `vscode` – makes interaction between the command line and the code editor easier.
- `z` [https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z)
- `zsh-autosuggestions` [https://github.com/zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- `zsh-syntax-highlighting` [https://github.com/zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

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
- `ls -(tab)`
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


# Install nvm

-  Instructions: [https://github.com/nvm-sh/nvm#installing-and-updating](https://github.com/nvm-sh/nvm#installing-and-updating)

# 3 Ways to Install Nodejs/Npm (Node Package Manager) on Ubuntu

- For Specific Version using nvm OR from NodeSource Repository: [https://phoenixnap.com/kb/install-latest-node-js-and-nmp-on-ubuntu](https://phoenixnap.com/kb/install-latest-node-js-and-nmp-on-ubuntu)
- todo extract above info

## Install Nodejs
```
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
```
[https://github.com/nodesource/distributions/blob/master/README.md#debinstall](https://github.com/nodesource/distributions/blob/master/README.md#debinstall)

# Installing GCC on Ubuntu 20.04

`sudo apt install build-essential`

# Install Python2 on Ubuntu

`sudo apt install python2`

# Install Angular Global

`npm install -g @angular/cli`

# Windows 10 Terminal 

[https://docs.microsoft.com/en-us/windows/terminal/](https://docs.microsoft.com/en-us/windows/terminal/)




