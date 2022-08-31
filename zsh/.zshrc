# Set editor to Neovim
export VISUAL=vim
export EDITOR=$VISUAL

# Add sbin to PATH
export PATH=$PATH:/sbin

# Add downloaded binaries to PATH
export PATH=$PATH:~/.binaries

# Add Gem packages to $PATH
export PATH=$PATH:~/.gem/ruby/2.5.0/bin

# Add Spicetify to path
export PATH="$PATH:$HOME/.spicetify"

# Set language to Spanish.
export LANG=es_ES.UTF-8

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
if [ "$TERM_PROGRAM" != "vscode" ]
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
