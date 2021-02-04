# Install and switch to zsh

- Via Package Manager: `apt install zsh`
- Verify installation by running `zsh --version`
- Make it your default shell: `chsh -s $(which zsh)`

# Install oh-my-zsh

- curl: `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- wget: `sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"`

# .config

```
git clone https://github.com/vincenthome/.config.git ~
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
