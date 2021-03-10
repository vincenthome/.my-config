# WSL + Windows Terminal Configurations + 2

[https://docs.microsoft.com/en-us/windows/terminal/](https://docs.microsoft.com/en-us/windows/terminal/)

## WSL
- Windows access Linux files: \\wsl$\Ubuntu-20.04\home\battlestar
- Linux access Windows files: /mnt/c/
- symlinks to make Windows paths easier to access: e.g. `ln s /mnt/c/Users/chitl/Downloads`  ~/Downloads
- wslview - open default Windows application for file extension
- wslpath

## Windows Termainl
- Quick Setup
  - Install Powerline Font: `Cascadia (Code|Mono) PL` ttf [https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup#install-a-powerline-font](https://docs.microsoft.com/en-us/windows/terminal/tutorials/powerline-setup#install-a-powerline-font)
  - git clone this repo to %USERPROFILE%
  - Settings Keyboard shortcut: `Ctrl + Alt + ,`
  - Customize Settings `Ctrl + Alt + ,`
    - Copy & paste content of [settings.json](WindowsTerminal/settings.json) to replace existing Settings

- Details:
  - Settings:
    - Fonts, Color Scheme
      ```
      "profiles":
      {
          "defaults":
          {
              "colorScheme" : "Dracula",
              "fontFace": "Cascadia Code PL"
          },
      ```
    - Special Font for Powerlevel10k
      ```
        "fontFace": "MesloLGS NF",
        "fontSize": 10,
      ```
    - Starting Directory
      ```
      "startingDirectory": "\\\\wsl$\\Ubuntu-20.04\\home\\battlestar\\",
      ```
    - ect ...
      
  - Color Schemes
    - [Switching Scheme](https://docs.microsoft.com/en-us/windows/terminal/customize-settings/color-schemes)
    - Dracula [https://draculatheme.com/windows-terminal](https://draculatheme.com/windows-terminal)

  - Tab Icons
    - [Switching Icon](https://docs.microsoft.com/en-us/windows/terminal/customize-settings/profile-general#icon)
    - Windows 10 built-in [Segoe MDL2 Icons codes for "Icon": ""](https://docs.microsoft.com/en-us/windows/uwp/design/style/segoe-ui-symbol-font#icon-list)

  - Pane
    - New Default Profile Vertical/Horizontal: `Alt + Shift + Plus` / `Alt + Shift + Minus`
    - New Current Profile (auto v/h): `Alt + Shift + D`
    - New Select Profile (auto v/h): `Alt + Dropdown`
    - Move Focus: `Alt + arrow keys`
    - Resize: `Alt + Shift + arrow keys`
    - [More](https://docs.microsoft.com/en-us/windows/terminal/panes)

# Install and switch to zsh

- Via Package Manager: `sudo apt install zsh`
- Verify installation by running `zsh --version`
- Make it your default shell: `chsh -s $(which zsh)`
- Current Shell: `echo $SHELL`

# Install oh-my-zsh

- `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

# Install .my-config

- Clone: `git clone https://github.com/vincenthome/.my-config.git ~/.my-config`
- edit ~/.zshrc: 
  - near front add: `[ -f "$HOME/.my-config/.zshrc" ] && source "$HOME/.my-config/.zshrc"` 
  - comment out `ZSH_THEME=`, `plugins=`. They are coming from `$HOME/.my-config/.zshrc`
  
# Popular Plugins

`~/.oh-my-zsh/custom/plugins`

- `autojump`
- `cloudapp` – uploads files and piped contents to the Cloudapp service. Outputs and copies the resultant URL to the clipboard.
- `command-not-found` – if a command is not recognized in the $PATH, this will use Ubuntu’s command-not-found package to find it or suggest spelling mistakes (Only for Ubuntu and openSUSE).
- `git`
- `lf`
- `node` – open the Node API, for your current version, in your browser.
- `npm` – adds autocompletion to npm.
- `sudo` – hitting ESC twice puts sudo in front of the current command, or the last one if the command line is empty.
- `vscode` – makes interaction between the command line and the code editor easier.
- `z` built-in [https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z)
- `zsh-autosuggestions` [https://github.com/zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- `zsh-syntax-highlighting` [https://github.com/zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  
# Popular Themes

`~/.oh-my-zsh/custom/theme`

- `Powerlevel10k` [https://github.com/romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k)
  - Font
    - Install Font: [https://github.com/romkatv/powerlevel10k#manual-font-installation](https://github.com/romkatv/powerlevel10k#manual-font-installation)
    - Set Font: Windows Terminal Settings - `"fontFace": "MesloLGS NF"`
  - `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
  - Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.my-config/.zshrc`
  - Configuration wizard: `p10k configure`
- `agnoster`
- `spaceship` * issue - prompt TOO slow
  - `git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1`
  - Symlink `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"`
  - Set `ZSH_THEME="spaceship"` in your .zshrc
  
## Activate Plugins, Themes

```
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git z zsh-autosuggestions)
```  

# Install lf (as in "list files") terminal file manager  

- `sudo curl -L https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz | sudo tar xzC /usr/local/bin`
- Tutorial: [https://github.com/gokcehan/lf/wiki/Tutorial](https://github.com/gokcehan/lf/wiki/Tutorial)

# Directory

- Skip `cd`
- `..` `...` `....` `.....` to move up x directories
- `/` `~`
- `take` Create a new directory and change to it
- `rd`
- partialDirectory `TAB` / some path `TAB`
- `z` from most frequent diretory list


# Git

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

# Misc

- `x` Extract an archive
- `alias` list all aliases
- `zsh_stats` Get a list of the top 20 commands and how many times they have been run.
- `uninstall_oh_my_zsh`
- `omz update` Upgrade Oh-my-zsh
- `ls -(tab)`
- `ssh (tab)`
- `unrar (tab)`

# Install Nodejs/Npm on Ubuntu

## Install nvm

-  Instructions: [https://github.com/nvm-sh/nvm#installing-and-updating](https://github.com/nvm-sh/nvm#installing-and-updating)
  - available versions: `nvm ls-remote`

## Install Nodejs

  - Specific Version: `nvm install 12.18.3`
    - Switch between Versions: `nvm use 8.11.1`
  - From NodeSource: [https://github.com/nodesource/distributions/blob/master/README.md#debinstall](https://github.com/nodesource/distributions/blob/master/README.md#debinstall)
    - e.g. Node 14 `curl -sL https://deb.nodesource.com/setup_14.x | sudo -E zsh -`
    - e.g. Node 12 `curl -sL https://deb.nodesource.com/setup_12.x | sudo -E zsh -`
    - `sudo apt-get install -y nodejs`

## Install jq 

- `sudo apt-get install jq`
- [Doc](https://stedolan.github.io/jq/manual/#Basicfilters)


# Install GCC on Ubuntu 20.04

`sudo apt install build-essential`

# Install Azure CLI

- Instructions: [https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt#option-1-install-with-one-command](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt#option-1-install-with-one-command)
- `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo zsh`
- `az --version`
- `az login`

# Install Azure DevOps CLI

- Instructions: [https://docs.microsoft.com/en-us/azure/devops/cli/?view=azure-devops](https://docs.microsoft.com/en-us/azure/devops/cli/?view=azure-devops)
- `az extension add --name azure-devops`
- `az devops configure --defaults organization=https://dev.azure.com/vincenthome project=angular`

# Install Kubectl

- Instructions: [https://kubernetes.io/docs/tasks/tools/install-kubectl/](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

1. Download: `curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`
2. Install: `sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`
3. Test: `kubectl version --client` 
4. Cleanup: `rm kubectl`

# Install Python2 on Ubuntu

`sudo apt install python2`

# Install Angular Global

`npm install -g @angular/cli@x.x.x`


# Authentication Options

## PAT Personal Access Token
- Install Git Credential Manager Core GCM on 'Windows Side' [GCM](https://docs.microsoft.com/en-us/azure/devops/repos/git/set-up-credential-managers?view=azure-devops#install-git-credential-manager-core)
- Install GCM on Ubuntu [GCM Linux](https://github.com/microsoft/Git-Credential-Manager-Core#linux-debian-package-deb)
  - Download: `curl -L https://xxxxxx --output gcmcore-linux_amd64.xxx.deb`
  - Install/Setup GCM
    ```
    sudo dpkg -i <path-to-package>
    git-credential-manager-core configure
    ```
  - Configure Git Credential Store / Cache [Ref](https://github.com/microsoft/Git-Credential-Manager-Core/blob/master/docs/linuxcredstores.md#3-gits-built-in-credential-cache)
    ```
    git config --global credential.credentialStore cache
    git config --global credential.cacheOptions "--timeout 300"  
    ```
- Reference 'Windows' GCM from a WSL distro: [Ref](https://docs.microsoft.com/en-us/windows/wsl/tutorials/wsl-git#git-credential-manager-setup)
  - `git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"`
- Using PAT Personal Access Token 
  - Github: Profile -> Settings -> Developer Settings -> Personal Access Tokens -> Generate new token
  - Azure: ???

## SSH

- Create SSH Key Pair in Ubuntu
  - `ssh-keygen` when prompted, provide custom filename e.g. `~/.ssh/xyz_id_rsa`
  - Set premission: `chmod 400 ~/.ssh/xyz_id_rsa` `chmod 400 ~/.ssh/xyz_id_rsa.pub` 
- For Windows: copy above files `cp ~/.ssh/xyz_id_rsa /mnt/c/.ssh` `cp ~/.ssh/xyz_id_rsa.pub /mnt/c/.ssh`

# Fonts
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

# GNU find

- File:  find dir -name filename // '.' current dir 
- wildcard * must enclosed w/ quote ' test*.* 
- Dir: find . -type d dirname
- cheatsheet - https://bencane.com/2012/07/22/cheat-sheet-21-useful-find-commands/ 
- grep word filename
 - … | less  // keystroke: 'b' back / 'spacebar' forward / 'q' quit


# Tips and Tricks

[https://www.sitepoint.com/zsh-tips-tricks/](https://www.sitepoint.com/zsh-tips-tricks/)

# Bindkey Tutorial [https://jdhao.github.io/2019/06/13/zsh_bind_keys/](https://jdhao.github.io/2019/06/13/zsh_bind_keys/)


