# WSL + Windows Terminal Configurations + 2

TOC
- [WSL](README.md#wsl)
- [Windows Terminal](README.md#windows-terminal)
- [Oh My Zsh](README.md#oh-my-zsh)
- [Install NVM, Nodejs/Npm on Ubuntu](README.md#install-nvm-nodejsnpm-on-ubuntu)
- [VS Code Integrated Terminal](README.md#vs-code-integrated-terminal)

## Prequisites

- [Install](https://docs.microsoft.com/en-us/azure/devops/repos/git/set-up-credential-managers?view=azure-devops#windows)  GCM on 'Windows Side' for interop with WSL


## [WSL](https://docs.microsoft.com/en-us/windows/wsl)
- Setup  
  - Factory 'Reset' then 'Uninstall': 1. `Ubuntu` and 2. `Windows Terminal` via "Add or Remove Programs" 's Advanced Options menu item.
  - [Delete Distro](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#unregister-and-reinstall-a-distribution): `wsl --unregister <distro>`
  - Install Distro from scratch: using Windows Store and click `Install`
  - Install Distro into WSL /w profile: using Windows Store and click `Open` OR command line `wsl --install -d <distro>`
  - Check Ubuntu Version: `lsb_release -a`
  - Get current username: `whoami` or `echo $USER`
  - Get latest Ubuntu packages: 1. `sudo apt update` 2. `sudo apt upgrade`
  - Multiple Instances of the same Distro
    - Export distro to tar: wsl --export Ubuntu-20.04 Ubuntu-20.04.tar.gz
    - Import distro from tar 1+ times: 
      ```
      wsl --import ub2004.vm1 C:\_wslvms\Ubuntu-20.04-112021\vm1 C:\_wslvms\Ubuntu-20.04-112021\Ubuntu-20.04.tar.gz
      ```
    - Assign an existing non-root user to distro
      - Add file to distro /etc/wsl.conf
        ```
        [automount]
        enabled=false
        root=//wsl$/ub2004.vm1/home/battlestar
        [user]
        default=battlestar
        ```
        - 1. exit distro 2. Command Prompt: wsl --shutdown

  - [WSL Utils - preinstalled by Ubuntu](https://github.com/wslutilities/wslu)
    - wslview - open default Windows application like notepad, pdf viewer, browser based on file extensions or url

- Tips
  - File Access Path Convention
    - Easiest: Windows Explorer Linux Penguin Icon
    - Windows access Linux files: `\\wsl$`
    - Linux access Windows files: `/mnt/c/`
    - Path translator wslpath: 
      - Linux -> Windows: wslpath -w ~
      - Windows -> Linux: wslpath "C:\Users\vince"
    - symlinks to make Windows paths easier to access: e.g. `ln s /mnt/c/Users/chitl/Downloads`  ~/Downloads

## Use Git Credential Manager (GCM) to authenticate.
Supports [Azure DevOps](https://docs.microsoft.com/en-us/azure/devops/repos/git/set-up-credential-managers?view=azure-devops), GitHub, Bitbucket.
  
- [Configure](https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/wsl.md#configuring-wsl-with-git-for-windows-recommended) WSL git client to use GCM
  ```
    git config --global credential.helper "/mnt/c/Program\ Files\ \(x86\)/Git\ Credential\ Manager\ Core/git-credential-manager-core.exe"

    # For Azure DevOps support only
    git config --global credential.https://dev.azure.com.useHttpPath true  
  ```  
- Using GCM: When you connect to a Git repository from your Git client for the first time, the credential manager prompts for credentials. Provide your Azure AD credentials. Once authenticated, the credential manager creates and caches a personal access token for future connections to the repo. Git commands that connect to this account won't prompt for user credentials until the token expires. A token can be revoked through Azure Repos.
- How it works inside WSL: GCM leverages the built-in interop between Windows and WSL. Git inside of a WSL can launch the GCM Windows application transparently to acquire credentials. Using the host operating system (Windows) to store credentials also means that your Windows applications and WSL can all share those credentials.
  


## [Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/)
- Quick Setup
  - git clone this repo .my-config in `C:\_wslvms`, allows setting up WT to reference icons, background images.
  - Distro Starting Directory (Settings UI): 
    ```
    \\wsl$\Ubuntu\home\battlestar\
    ```
  - Dracula Color Scheme
    - Download: [https://draculatheme.com/windows-terminal](https://draculatheme.com/windows-terminal)
    - Install: In the settings.json settings file for Windows Terminal, find the schemes section and paste the content of dracula.json
    - [About Switching Scheme](https://docs.microsoft.com/en-us/windows/terminal/customize-settings/color-schemes)
  - Powerline Font (Default for ALL profiles): `Cascadia (Code|Mono) PL` ttf 
    - Download: [https://docs.microsoft.com/en-us/windows/terminal/cascadia-code](https://docs.microsoft.com/en-us/windows/terminal/cascadia-code)
    - Default Profile `Color Schema`, `Font face` (Settings UI):
      ```
      Dracula
      ```
      ```
      Cascadia Code PL
      ```
  - MesloLGS NF Font (for oh-my-zsh -> theme -> Powerlevel10k)
    - Download: [https://github.com/romkatv/powerlevel10k#manual-font-installation](https://github.com/romkatv/powerlevel10k#manual-font-installation)
    - Distro `Font face`, `Font size` (Settings UI):
        ```
        MesloLGS NF
        ```
        ```
        10
        ```
  - Sample [settings.json](WindowsTerminal/settings.json)
    - useful fields:
      - `"confirmCloseAllTabs": false`
      - `"tabColor": "#DD4814",`

- Tips:
  - [Command Line](https://docs.microsoft.com/en-us/windows/terminal/command-line-arguments?tabs=windows#command-line-syntax) open multiple distros profiles with starting directory and split pane horizontally (-H)/vertically (-V). Move focus 1 up.
    - wt -p ub2004.vm1 -d /mnt/c/Users/vince ; sp -H -d /home/battlestar -p ub2004.vm1 ; mf up
  - Pane
    - New Default Profile Vertical/Horizontal: `Alt + Shift + Plus` / `Alt + Shift + Minus`
    - New Current Profile (auto v/h): `Alt + Shift + D`
    - New Select Profile (auto v/h): `Alt + Dropdown`
    - Move Focus: `Alt + arrow keys`
    - Resize: `Alt + Shift + arrow keys`
    - [More](https://docs.microsoft.com/en-us/windows/terminal/panes)

## Oh My Zsh
- Install and switch to zsh first
  - Via Package Manager: `sudo apt install zsh`
  - Verify installation by running `zsh --version`
  - Make it your default shell: `chsh -s $(which zsh)`
  - Open new shell and choose option (2) - Recommended by System Admin
  - Current Shell: `echo $SHELL`

- Install oh-my-zsh
  ```
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

- Install .my-config (custom oh-my-zsh config)
  - git clone this repo .my-config in `~`
  - edit ~/.zshrc: 
    - near front add:
      ```
      [ -f "$HOME/.my-config/.zshrc" ] && source "$HOME/.my-config/.zshrc"
      ```
    - near end add:
      ```
      [ -f "$HOME/.my-config/.p10k.zsh" ] && source "$HOME/.my-config/.p10k.zsh"
      ```
    - comment out `ZSH_THEME=`, `plugins=`. They are coming from `$HOME/.my-config/.zshrc`
  - Custom
    - Evironment Variables Global/Local
      - custom environment variables in `$HOME/.my-config/.zshrc`
      - `set` list all global variables
      - `env` list all global AND local variables
    - Alias
      - custom alias in `$HOME/.my-config/.aliasrc`
      - `alias` list all aliases
    - Prompt Elements
      - custom Right Prompt Elements in `$HOME/.my-config/.p10k.zsh`
        - e.g. POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS ↦ package/node_version
  
- Popular Plugins for `~/.oh-my-zsh/custom/plugins`
  - `zsh-autosuggestions` Required before switching theme. [https://github.com/zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    ```
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
  - `zsh-syntax-highlighting` Required before switching theme. [https://github.com/zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    ```
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    ```
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

  - Example: activate Plugins: `plugins=(git z zsh-autosuggestions)`  

- Popular Themes for `~/.oh-my-zsh/custom/theme`
  - `Powerlevel10k` [https://github.com/romkatv/powerlevel10k](https://github.com/romkatv/powerlevel10k)
    - Install
      ```
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
      ```
    - Open New Shell: Prompt Configuration wizard - `p10k configure`
    - Add package.json version to prompt: Edit .p10k.zsh -> Uncomment POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS e.g.
      - `package`
      - `node_version`
  - Example: activate Themes: `ZSH_THEME="powerlevel10k/powerlevel10k"`  
  - ~~`agnoster`~~
  - ~~`spaceship` * issue - prompt TOO slow~~
    - ~~`git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1`~~
    - ~~Symlink `ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"`~~
    - ~~Set `ZSH_THEME="spaceship"` in your .zshrc~~
  
  

- File Managers
  - Midnight Commander: `sudo apt-get install mc`
  - [lf](https://github.com/gokcehan/lf) (as in "list files")
    - `sudo curl -L https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz | sudo tar xzC /usr/local/bin`
    - Tutorial: [https://github.com/gokcehan/lf/wiki/Tutorial](https://github.com/gokcehan/lf/wiki/Tutorial)

- Tips
  - Directory
    - Skip `cd`
    - `..` `...` `....` `.....` to move up max 6 directories
    - `/` `~`
    - partialDirectory `TAB` / some path `TAB`
    - `z` from most frequent diretory list
    - `take` Create a new directory and change to it
    - `rd`
  - Environment Variable
    - `set` display all the ENVs(global as well as local)
    - `env` display all the global ENVs
    - `echo $MY_VAR` display single variable
    - `set MY_GLOBAL_VAR=xyz` set global variable
      - alternative: `export` MY_GLOBAL_VAR=xyz set global variable
    - `MY_LOCAL_VAR=xyz` set local variable
  - Command Helpers
    - `→` zsh-autosuggestions plugin: as you type a command, press `→` to accept
    - `↑↓` zsh_history plugin: as you type a command, press `↑↓` to cycle through matching entries
    - XYZ_COMMAND `-(tab)` list command options (concise)
    - `zsh_stats` Analytic: list top commands and how many times used.
  - Keys
    - `Ctrl + L` – clear the terminal.
    - `Ctrl + U` – delete from the cursor to the start of the _line_.
    - `Ctrl + K` – delete from the cursor to the end of the _line_.
    - `Ctrl + W` – delete from the cursor to the start of the preceding _word_.
    - `Alt + D` – delete from the cursor to the end of the next _word_.
  - Others
    - [git plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
    
    - `uninstall_oh_my_zsh`
    - `omz update` Upgrade Oh-my-zsh

  - Articles
    - [https://www.sitepoint.com/zsh-tips-tricks/](https://www.sitepoint.com/zsh-tips-tricks/)
    - Bindkey Tutorial [https://jdhao.github.io/2019/06/13/zsh_bind_keys/](https://jdhao.github.io/2019/06/13/zsh_bind_keys/)

## Install VS Code
1. Install on Windows Side
2. WSL Side: `code .`

  ![image](https://user-images.githubusercontent.com/1560643/140314221-1d2dbb0f-e3ed-4d71-8126-a68e91821385.png)

- [Integrated Terminal](https://code.visualstudio.com/docs/editor/integrated-terminal)


## Install NVM, Nodejs/Npm on Ubuntu

- NVM
  - [Install](https://github.com/nvm-sh/nvm#installing-and-updating) then restart shell
    ```
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | zsh
    ```
  - Usage: [https://github.com/nvm-sh/nvm#usage](https://github.com/nvm-sh/nvm#usage)

- Install Nodejs
  - available node versions: `nvm ls-remote`
  - installed node versions: `nvm ls`
  - Install specific node Version: `nvm install 12.18.3`
  - Use specific node Versions: `nvm use 8.11.1`
  - From NodeSource: [https://github.com/nodesource/distributions/blob/master/README.md#debinstall](https://github.com/nodesource/distributions/blob/master/README.md#debinstall)
    - e.g. Node 14 `curl -sL https://deb.nodesource.com/setup_14.x | sudo -E zsh -`
    - e.g. Node 12 `curl -sL https://deb.nodesource.com/setup_12.x | sudo -E zsh -`
    - `sudo apt-get install -y nodejs`

## Install JSON processor [jq](https://stedolan.github.io/jq/manual/#Basicfilters) 

```
sudo apt-get install jq
```

## Install Angular
  ```
  npm install -g @angular/cli@x.x.x
  ```
## Languages
- [Python 3](https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-local-programming-environment-on-ubuntu-20-04): 
  - python3: preinstalled on ubuntu 20.04. Check: python3 --version
  - PIP: `sudo apt install -y python3-pip`
  - Development tools: `sudo apt install build-essential libssl-dev libffi-dev python-dev`
  - Virtual Environment venv: `sudo apt install -y python3-venv`
  - Create Environment
    ```
    mkdir environments
    cd environments
    python3 -m venv my_env
    source my_env/bin/activate
    ```
- Python 2 `sudo apt install python2`
- Java: `sudo apt install openjdk-11-jre-headless`
- Go: `sudo apt install golang-go`
- Rust: `sudo apt install rustc`
- [C++](https://linuxconfig.org/how-to-install-g-the-c-compiler-on-ubuntu-20-04-lts-focal-fossa-linux): `sudo apt install build-essential`
## Install Azure CLI

- Instructions: [https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt#option-1-install-with-one-command](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt#option-1-install-with-one-command)
- `curl -sL https://aka.ms/InstallAzureCLIDeb | sudo zsh`
- `az --version`
- `az login`

## Install Azure DevOps CLI

- Instructions: [https://docs.microsoft.com/en-us/azure/devops/cli/?view=azure-devops](https://docs.microsoft.com/en-us/azure/devops/cli/?view=azure-devops)
- `az extension add --name azure-devops`
- `az devops configure --defaults organization=https://dev.azure.com/vincenthome project=angular`

## Install Kubectl

- Instructions: [https://kubernetes.io/docs/tasks/tools/install-kubectl/](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

1. Download: `curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`
2. Install: `sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`
3. Test: `kubectl version --client` 
4. Cleanup: `rm kubectl`

## Install Azure Data Studio
- [Azure Data Studio user installer for Windows](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15#windows-installation)
- [WSL integration](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15#windows-subsystem-for-linux)
- run `azuredatastudio .` or Alias ads
- Font for integrated terminal - [MesloLGS NF](https://github.com/romkatv/powerlevel10k/blob/master/font.md)
- [Documentation](https://docs.microsoft.com/en-us/sql/azure-data-studio/?view=sql-server-ver15)

## Authentication Options
- GCM on Ubuntu
  - Install GCM on Ubuntu [GCM Linux](https://github.com/GitCredentialManager/git-credential-manager#linux)
    - Download: `curl -LO https://xxxxxx`
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

- PAT Personal Access Token
  - Using PAT Personal Access Token 
    - Github: Profile -> Settings -> Developer Settings -> Personal Access Tokens -> Generate new token
    - Azure: ???

-SSH
  - Create SSH Key Pair in Ubuntu
    - `ssh-keygen` when prompted, provide custom filename e.g. `~/.ssh/xyz_id_rsa`
    - Set premission: `chmod 400 ~/.ssh/xyz_id_rsa` `chmod 400 ~/.ssh/xyz_id_rsa.pub` 
  - For Windows: copy above files `cp ~/.ssh/xyz_id_rsa /mnt/c/.ssh` `cp ~/.ssh/xyz_id_rsa.pub /mnt/c/.ssh`

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





