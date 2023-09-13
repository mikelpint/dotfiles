# Set editor to Neovim
export VISUAL=vim
export EDITOR=$VISUAL

# Add sbin to PATH
export PATH=$PATH:/sbin

# Add downloaded binaries to PATH
export PATH=$PATH:~/.binaries

# Allow OBS to capture screen on Wayland
export QT_QPA_PLATFORM="wayland;xcb"

# Load shared objects immediately for better first time latency in MangoHud
export LD_BIND_NOW=1

# MangoHud in Vulkan games
export MANGOHUD=1

# FSync while using Wine
export WINEFSYNC=1

# Payloads directory for fusee-launcher
export SWPL=/opt/fusee-launcher

# Add Gem packages to $PATH
export PATH=$PATH:~/.gem/ruby/2.5.0/bin

# Add Spicetify to path
export PATH="$PATH:$HOME/.spicetify"

# Set language to American English.
export LANG=en_US.UTF-8

# Intel C Compiler
export PATH=$PATH:/opt/intel/oneapi/compiler/latest/linux/bin

# Set the default Vagrant provider to VirtualBox
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# For using URxvt
export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
bindkey ';5D' backward-word
bindkey ';5C' forward-word

# Make numpad enter work
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"

# Terminal window title
DISABLE_AUTO_TITLE="true"

function set_terminal_title() {
  echo -en "\e]2;$@\a"
}

# Theme
ZSH_THEME="ys"

# Plugins
plugins=(
    git
    vagrant
    web-search
    wd
    sprunge
    archlinux
    tmux
    sudo
    zsh-syntax-highlighting
    zsh-autosuggestions
    vscode
    dnf
    battery
    copypath
)

# Tmux plugin's configuration
if [ "$TERM_PROGRAM" != "vscode" ] && [[ $(ps -o comm= -p $(ps -o ppid= -p $$)) != *"clion"* ]] && [ "$CLION" != true ]
then
    export ZSH_TMUX_AUTOSTART=true
    export ZSH_TMUX_AUTOCONNECT=true
fi

#auto-ls plugin's configuration
AUTO_LS_COMMANDS=(ls)
AUTO_LS_NEWLINE=false

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"

# Custom plugins
source "$ZSH_CUSTOM/plugins/auto-ls.zsh"
source "$ZSH_CUSTOM/plugins/calc.zsh"

# Aliases and fuctions
source "$HOME/.config/zsh/.functions.zsh"
source "$HOME/.config/zsh/.aliases.zsh"
source /usr/share/nvm/init-nvm.sh
