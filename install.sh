#!/bin/bash

if [ -f /usr/bin/dialog ]
then
    :
elif [ -f /usr/local/bin/dialog ]
then
    :
else
    echo "Please install dialog before continuing."
    exit 1
fi

if [ ! -f /usr/bin/stow ]
then
    echo "Please install GNU Stow before continuing."
    exit 2
fi


cmd=(dialog --backtitle "mikelpint's dotfiles: Installation script" --menu "Select an option:" 20 40 10)

options=(
    1 "Arch Linux"
    2 "Git"
    3 "Tmux"
    4 "Neovim"
    5 "Zsh"
    6 "BSPWM"
    7 "Polybar"
    8 "X11"
    9 "sxhkd"
    10 "Compton"
    11 "Xfce"
    12 "Conky"
    13 "VSCode"
    14 "Exit"
)

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
        1)
            clear
            if [ -f /etc/pacman.conf ]; then
                sudo mv /etc/pacman.conf /etc/pacman.conf.before
            fi
            sudo stow archlinux -t /etc ;;
        2)
            clear
            if [ -f ~/.gitconfig ]; then
                mv ~/.gitconfig ~/.gitconfig.before
            fi
            stow git ;;
        3)
            clear
            if [ -f ~/.tmux.conf ]; then
                mv ~/.tmux.conf ~/.tmux.conf.before
                mv ~/.tmux ~/.tmux-before
            fi
            stow tmux ;;
        4)
            clear
            if [ -f ~/.config/nvim/init.vim ]; then
                mv ~/.config/nvim ~/.config/nvim-before
            fi
            stow nvim/.config/nvim
            nvim +PlugInstall +qall > /dev/null
            if [ -f ~/.config/nvim/plugged/youcompleteme/.installed ]; then
                :
            else
                python ~/.config/nvim/plugged/youcompleteme/install.py > /dev/null
                touch ~/.config/nvim/plugged/youcompleteme/.installed
            fi
            ;;
        5)
            clear
            if [ ! -f ~/.oh-my-zsh/oh-my-zsh.sh ]; then
                sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
            fi
            if [ ! -f ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting.plugin.zsh ]; then
                git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
            fi
            if [ ! -f ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions.plugin.zsh ]; then
                git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
            fi
            if [ ! -f ~/.oh-my-zsh/custom/plugins/auto-ls.zsh ]; then
                curl -L https://git.io/auto-ls > ~/.oh-my-zsh/custom/plugins/auto-ls.zsh
            fi
            if [ ! -f ~/.oh-my-zsh/custom/plugins/calc/calc.plugin.zsh ]; then
                git clone https://github.com/arzzen/calc.plugin.zsh.git ~/.oh-my-zsh/custom/plugins/calc
            fi
            if [ -f ~/.zshrc ]; then
                mv ~/.zshrc ~/.zshrc.before
                mv ~/.keybindings.zsh ~/.keybindings.zsh.before
                mv ~/.aliases.zsh ~/.aliases.zsh.before
                mv ~/.functions.zsh ~/.functions.zsh.before
                mv ~/.moreplugins.zsh ~/.moreplugins.zsh.before
            fi
            stow zsh ;;
        6)
            clear
            if [ -f ~/.config/bspwm ]; then
                mv ~/.config/bspwm ~/.config/bspwm-before
                mv ~/.sxhkd ~/.config/sxhkd-before
            fi
            stow bspwm ;;
        7)
            clear
            if [ -f ~/.config/polybar/config ]; then
                mv ~/.config/polybar ~/.config/polybar-before
            fi
            stow polybar ;;
        8)
            clear
            if [ -f ~/.Xresources ]; then
                mv ~/.Xresources ~/.Xresources.before
            fi
            if [ -f ~/.xinitrc ]; then
                mv ~/.xinitrc ~/.xinitrc.before
            fi
            stow x11 ;;
        9)
            clear
            if [ -d ~/.config/sxhkd/ ]; then
                mv ~/.config/sxhkd ~/.config/sxhkd-before
            fi
            stow sxhkd ;;
        10)
            clear
            if [ -f ~/.config/compton.conf ]; then
                mv ~/.config/compton.conf ~/.config/compton.conf
            fi
            stow compton ;;
        11)
            clear
            if [ -d ~/.config/xfce4 ]; then
                mv ~/.config/xfce4 ~/.config/xfce4-before
            fi
            stow xfce ;;
        12)
            clear
            if [ -f ~/.conkyrc ]; then
                mv ~/.conkyrc ~/.conkyrc.before
            fi
            stow conky ;;
        13)
            clear
            if [ -d ~/.config/Code]; then
                mv ~/.config/Code ~/.config/Code-before
            fi
            stow vscode ;;
        14)
            clear
            exit 0 ;;
    esac
done

clear
