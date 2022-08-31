#!/bin/bash

BACKUP_DIR="$HOME/.dotfiles-backup"
OPERATING_SYSTEM=4

check_os () {
    if [ -f "/etc/redhat-release" ]
    then
        OPERATING_SYSTEM=1
        return
    fi

    if [ -f "/etc/debian_version" ]
    then
        OPERATING_SYSTEM=2
        return
    fi

    if [ -f "/etc/arch-release" ]
    then
        OPERATING_SYSTEM=3
    fi

    if [ "$(command -v lsb_release)" ]
    then
        local distributor_id=$(lsb_release -i | cut -c 17-)

        case $distributor_id in
            "Fedora")
                OPERATING_SYSTEM=1
                ;;
            "Debian")
                OPERATING_SYSTEM=2
                ;;
            "Ubuntu")
                OPERATING_SYSTEM=2
                ;;
            "Arch")
                OPERATING_SYSTEM=3
        esac
    fi
}

check_dependencies () {
    for dependency in "$@"
    do
        case $dependency in
            dunst)
                if [ ! "$(command -v dunst)" ]
                then
                    install_dunst
                fi
                ;;
            git)
                if [ ! "$(command -v git)" ]
                then
                    install_git
                fi
                ;;
            i3)
                if [ -d "$(command -v i3)" ]
                then
                    install_i3
                fi
                ;;
            keychain)
                if [ -d "$(command -v keychain)" ]
                then
                    install_keychain
                fi
                ;;
            neofetch)
                if [ -d "$(command -v neofetch)" ]
                then
                    install_neofetch
                fi
                ;;
            picom)
                if [ -d "$(command -v picom)" ]
                then
                    install_picom
                fi
                ;;
            polybar)
                if [ -d "$(command -v polybar)" ]
                then
                    install_polybar
                fi
                ;;
            rofi)
                if [ -d "$(command -v rofi)" ]
                then
                    install_rofi
                fi
                ;;
            stow)
                if [ ! "$(command -v stow)" ]
                then
                    install_stow
                fi
                ;;
            tmux)
                if [ -d "$(command -v tmux)" ]
                then
                    install_tmux
                fi
                ;;
            urxvt)
                if [ -d "$(command -v urxvt)" ]
                then
                    install_urxvt
                fi
                ;;
            xorg)
                if [ -d "$(command -v Xorg)" ]
                then
                    install_x11
                fi
                ;;
            zsh)
                if [ ! "$(command -v zsh)" ]
                then
                    install_zsh
                fi
                ;;
        esac
    done
}

create_backup_dir () {
    if [ ! -d "$BACKUP_DIR" ]
    then
        mkdir "$BACKUP_DIR"
    fi

    if [ -n "$1" ]
    then
        mkdir "${BACKUP_DIR:?}/$1"
    fi
}

previous_backup () {
    if [ -d "${BACKUP_DIR:?}/$1" ]
    then
        local option=''
        read -p "There is a previous backup in $BACKUP_DIR. Do you want to delete it and proceed? [Y/N]: " option
        option=$(tr '[:upper:]' '[:lower:]' <<< "$option")

        if [[ $option = "y" || $option = "yes" ]]
        then
            rm -rf "${BACKUP_DIR:?}/$1"
        else
            exit 1
        fi
    fi
}

delete_empty_backup_dir () {
    if [ ! -d "$BACKUP_DIR" ]
    then
        return
    fi

    if [ -z "$1" ]
    then
        if [ -z "$(ls -A "${BACKUP_DIR:?}/$1")" ]
        then
            rm -rf "$BACKUP_DIR"
        fi
    else
        if [ -z "$(ls -A "$BACKUP_DIR")" ]
        then
            rm -rf "$BACKUP_DIR"
        fi
    fi
}

install_dunst () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install Dunst."
        exit 1
    fi

    echo "Installing Dunst..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y dunst > /dev/null 2>&1
            ;;
        2)
            sudo apt install -y dunst > /dev/null 2>&1
            ;;
        3)
            sudo pacman -S --noconfirm dunst > /dev/null 2>&1
            ;;
    esac
}

install_git () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install Git."
        exit 1
    fi

    echo "Installing Git..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y git > /dev/null 2>&1
            ;;
        2)
            sudo apt install -y git > /dev/null 2>&1
            ;;
        3)
            sudo pacman -S --noconfirm git > /dev/null 2>&1
            ;;
    esac
}

install_i3 () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install i3-gaps."
        exit 1
    fi

    echo "Installing i3-gaps..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y i3-gaps > /dev/null 2>&1
            ;;
        2)
            sudo add-apt-repository ppa:regolith-linux/release -y > /dev/null 2>&1
            sudo apt update -y > /dev/null 2>&1
            sudo apt install -y i3-gaps > /dev/null 2>&1
            ;;
        3)
            sudo pacman -S --noconfirm i3-gaps > /dev/null 2>&1
            ;;
    esac
}

install_keychain () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install Keychain."
        exit 1
    fi

    echo "Installing Keychain..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y keychain > /dev/null 2>&1
            ;;
        2)
            sudo apt install -y keychain > /dev/null 2>&1
            ;;
        3)
            sudo pacman -S --noconfirm keychain > /dev/null 2>&1
            ;;
    esac
}

install_neofetch () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install Neofetch."
        exit 1
    fi

    echo "Installing Neofetch..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y neofetch > /dev/null 2>&1
            ;;

        2)
            sudo apt install -y neofetch > /dev/null 2>&1
            ;;

        3)
            sudo pacman -S --noconfirm neofetch > /dev/null 2>&1
            ;;
    esac
}


install_picom () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install Picom."
        exit 1
    fi

    echo "Installing Polybar..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y picom > /dev/null 2>&1
            ;;
        2)
            sudo apt install -y picom > /dev/null 2>&1
            ;;
        3)
            sudo pacman -S --noconfirm picom > /dev/null 2>&1
            ;;
    esac
}

install_polybar () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install Polybar."
        exit 1
    fi

    echo "Installing Polybar..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y polybar > /dev/null 2>&1
            ;;
        2)
            sudo apt install -y polybar > /dev/null 2>&1
            ;;
        3)
            sudo pacman -S --noconfirm polybar > /dev/null 2>&1
            ;;
    esac
}

install_rofi () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install Rofi."
        exit 1
    fi

    echo "Installing Rofi..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y rofi > /dev/null 2>&1
            ;;
        2)
            sudo apt install -y rofi > /dev/null 2>&1
            ;;
        3)
            sudo pacman -S --noconfirm rofi > /dev/null 2>&1
            ;;
    esac
}

install_stow () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install GNU Stow."
        exit 1
    fi

    echo "Installing GNU Stow..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y stow > /dev/null 2>&1
            ;;
        2)
            sudo apt install -y stow > /dev/null 2>&1
            ;;
        3)
            sudo pacman -S --noconfirm stow > /dev/null 2>&1
            ;;
    esac
}

install_tmux () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install tmux."
        exit 1
    fi

    echo "Installing tmux..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y tmux > /dev/null 2>&1
            ;;
        2)
            sudo apt install -y tmux > /dev/null 2>&1
            ;;
        3)
            sudo pacman -S --noconfirm tmux > /dev/null 2>&1
            ;;
    esac
}

install_urxvt () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install URxvt."
        exit 1
    fi

    echo "Installing URxvt..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y rxvt-unicode > /dev/null 2>&1
            ;;
        2)
            sudo apt install -y rxvt-unicode > /dev/null 2>&1
            ;;
        3)
            sudo pacman -S --noconfirm rxvt-unicode > /dev/null 2>&1
            ;;
    esac
}

install_xorg () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install Xorg."
        exit 1
    fi

    echo "Installing Xorg..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y @base-x > /dev/null 2>&1
            ;;
        2)
            sudo apt install -y xorg > /dev/null 2>&1
            ;;
        3)
            sudo pacman -S --noconfirm xorg > /dev/null 2>&1
            ;;
    esac
}

install_zsh () {
    if [ $OPERATING_SYSTEM -eq 4 ]
    then
        echo "Please, install Zsh."
        exit 1
    fi

    echo "Installing Zsh..."

    case $OPERATING_SYSTEM in
        1)
            sudo dnf install -y zsh > /dev/null 2>&1
            ;;
        2)
            sudo apt install -y zsh > /dev/null 2>&1
            ;;
        3)
            sudo pacman -S --noconfirm zsh > /dev/null 2>&1
            ;;
    esac
}

dunst_dots () {
    check_dependencies dunst

    previous_backup dunst
    create_backup_dir dunst

    if [ -d "$HOME/.config/dunst" ]
    then
        mkdir "$BACKUP_DIR/dunst/.config"
        mv "$HOME/.config/dunst" "$BACKUP_DIR/dunst/.config/dunst"
    fi

    delete_empty_backup_dir dunst

    stow dunst
}

git_dots () {
    check_dependencies git

    previous_backup git
    create_backup_dir git

    if [ -f "$HOME/.gitconfig" ]
    then
        mv "$HOME/.gitconfig" "$BACKUP_DIR/git"
    fi

    if [ -d "$HOME/.gitconf" ]
    then
        mv "$HOME/.gitconf" "$BACKUP_DIR/git/.gitconf"
    fi

    delete_empty_backup_dir git

    stow git

    local git_name
    local git_email
    read -rp "Enter your name: " git_name
    read -rp "Enter your email address: " git_email

    echo -e "[user]\n    user = $git_name\n    email = $git_email" > $HOME/.gitconf/credentials
}

i3_dots () {
    check_dependencies i3

    previous_backup i3
    create_backup_dir i3

    if [ -d "$HOME/.config/i3" ]
    then
        mkdir "$BACKUP_DIR/i3/.config"
        mv "$HOM/.config/i3" "$BACKUP_DIR/i3/.config/i3"
    fi

    delete_empty_backup_dir i3

    stow i3
}

neofetch_dots () {
    check_dependencies neofetch

    previous_backup neofetch
    create_backup_dir neofetch

    if [ -d "$HOME/.config/neofetch" ]
    then
        mkdir "$BACKUP_DIR/neofetch/.config"
        mv "$HOME/.config/neofetch" "$BACKUP_DIR/neofetch/.config/neofetch"
    fi

    delete_empty_backup_dir neofetch

    stow neofetch
}

picom_dots () {
    check_dependencies picom

    previous_backup picom
    create_backup_dir picom

    if [ -d "$HOME/.config/picom" ]
    then
        mkdir "$BACKUP_DIR/picom/.config"
        mv "$HOME/.config/picom" "$BACKUP_DIR/picom/.config/picom"
    fi

    delete_empty_backup_dir picom

    stow picom
}

polybar_dots () {
    check_dependencies polybar

    previous_backup polybar
    create_backup_dir polybar

    if [ -d "$HOME/.config/polybar" ]
    then
        mkdir "$BACKUP_DIR/polybar/.config"
        mv "$HOME/.config/polybar" "$BACKUP_DIR/polybar/.config/polybar"
    fi

    delete_empty_backup_dir polybar

    stow polybar
}

rofi_dots () {
    check_dependencies rofi

    previous_backup rofi
    create_backup_dir rofi

    if [ -d "$HOME/.config/rofi" ]
    then
        mkdir "$BACKUP_DIR/rofi/.config"
        mv "$HOME/.config/rofi" "$BACKUP_DIR/rofi/.config/rofi"
    fi

    delete_empty_backup_dir rofi

    stow rofi
}

tmux_dots () {
    check_dependencies tmux git

    previous_backup tmux
    create_backup_dir tmux

    if [ -f "$HOME/.tmux.conf" ]
    then
        mv "$HOME/.tmux.conf" "$BACKUP_DIR/tmux"
    fi

    if [ -d "$HOME/.tmux" ]
    then
        mv "$HOME/.tmux" "$BACKUP_DIR/tmux/.tmux"
    fi

    delete_empty_backup_dir tmux

    stow tmux

    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tmux-sensible $HOME/.tmux/plugins/tmux-sensible
    git clone https://github.com/arcticicestudio/nord-tmux.git $HOME/.tmux/plugins/nord-tmux
}

x11_dots () {
    check_dependencies xorg urxvt

    previous_backup x11
    create_backup_dir x11

    if [ -f "$HOME/.Xresources" ]
    then
        mv "$HOME/.Xresources" "$BACKUP_DIR/x11"
    fi

    if [ -d "$HOME/.urxvt" ]
    then
        mv "$HOME/.urxvt" "$BACKUP_DIR/x11"
    fi

    delete_empty_backup_dir x11

    mkdir -p "$HOME/.urxvt/ext"

    curl -o "$HOME/.urxvt/ext/keyboard-select" https://raw.githubusercontent.com/muennich/urxvt-perls/master/keyboard-select > /dev/null 2>&1
    curl -o "$HOME/.urxvt/ext/clipboard" https://raw.githubusercontent.com/muennich/urxvt-perls/master/deprecated/clipboard > /dev/null 2>&1
    curl -o "$HOME/.urxvt/ext/url-select" https://raw.githubusercontent.com/muennich/urxvt-perls/master/deprecated/url-select > /dev/null 2>&1

    stow x11
}

zsh_dots () {
    check_dependencies keychain zsh

    previous_backup zsh
    create_backup_dir zsh

    if [ -d "$HOME/.oh-my-zsh" ]
    then
        mv "$HOME/.oh-my-zsh" "$BACKUP_DIR/zsh"
    fi

    if [ -f "$HOME/.zshrc" ]
    then
        mv "$HOME/.zshrc" "$BACKUP_DIR/zsh"
    fi

    if [ -d "$HOME/.config/zsh" ]
    then
        mkdir "$BACKUP_DIR/zsh/.config"
        mv "$HOME/.config/zsh" "$BACKUP_DIR/zsh/.config/zsh"
    fi

    delete_empty_backup_dir zsh

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null 2>&1
    rm "$HOME/.zshrc"

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" > /dev/null 2>&1
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" > /dev/null 2>&1
    curl -o "$HOME/.oh-my-zsh/custom/plugins/calc.zsh" https://raw.githubusercontent.com/arzzen/calc.plugin.zsh/master/calc.plugin.zsh > /dev/null 2>&1
    curl -o "$HOME/.oh-my-zsh/custom/plugins/auto-ls.zsh" https://raw.githubusercontent.com/desyncr/auto-ls/master/auto-ls.zsh > /dev/null 2>&1

    stow zsh
}

possible_arguments=("all" "desktop" "dunst" "git" "i3" "neofetch" "picom" "polybar" "rofi" "tmux" "x11" "zsh")

if [ $# -eq 0 ]
then
    echo "You need to pass one of the following options as an argument:"
    echo -e "${possible_arguments[*]}" | awk '{gsub (/ /,"\n- "); print "- " $0;}'

    exit 1
fi

for arg in "$@"
do
    if [[ ! " ${possible_arguments[*]} " =~ ${arg} ]]
    then
        echo "$arg is not a valid argument."

        exit 1
    fi
done

cd "$(dirname "$0")" || exit 1

check_os
check_dependencies stow

if [[ " ${*} " =~ " all " ]]
then
    dunst_dots
    git_dots
    i3_dots
    neofetch_dots
    picom_dots
    polybar_dots
    rofi_dots
    tmux_dots
    x11_dots
    zsh_dots

elif [[ " ${*} " =~ " desktop " ]]
then
    dunst_dots
    i3_dots
    picom_dots
    polybar_dots
    x11_dots

else
    args=("$(for arg in "$@"; do echo "${arg}"; done | sort -u)")

    for arg in "${args[@]}"
    do
        case $arg in
            dunst)
                dunst_dots
                ;;
            git)
                git_dots
                ;;
            i3)
                i3_dots
                ;;
            neofetch)
                neofetch_dots
                ;;
            picom)
                picom_dots
                ;;
            polybar)
                polybar_dots
                ;;
            rofi)
                rofi_dots
                ;;
            tmux)
                tmux_dots
                ;;
            x11)
                x11_dots
                ;;
            zsh)
                zsh_dots
                ;;
        esac
    done
fi

delete_empty_backup_dir