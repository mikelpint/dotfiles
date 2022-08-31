# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# Vim functions
alias :q='exit'

# Colored cat
if [ -f /usr/bin/lolcat ]; then
    alias cat='lolcat'
fi

# Simplified man pages
if [ -f /usr/bin/tldr ]; then
    alias man='tldr'
fi

# Replace Vim with NVim
if [ -f /usr/bin/nvim ]; then
    alias vim='nvim'
fi

# Replace ls with Exa
if [ -f /usr/bin/exa ]; then
    alias ls='exa'
fi

# List files matching the specified name
alias lsg='ls -l | grep'

# Editing dotfiles
alias zshconf="$EDITOR ~/.zshrc"
alias visudo="$EDITOR /etc/sudoers"
alias vimconf="$EDITOR ~/.vimrc"
alias tmuxconf="$EDITOR ~/.tmux.conf"
alias gitconf="$EDITOR ~/.gitconfig"
alias i3conf="$EDITOR ~/.config/i3/config"
alias pbconf="$EDITOR ~/.config/polybar/config"

# Spotify
alias spp="playerctl play-pause"
alias sm="songmetadata"

# Override rm -i alias which makes rm prompt for every action
alias rm='nocorrect rm'

# True commands
alias tman='/usr/bin/man' # Man
alias tvim='/usr/bin/vim' # Vim
alias tcat='/usr/bin/cat' # Cat
alias tls='/usr/bin/ls' # LS

# Make sudo don't ignore aliases
alias sudo='sudo '
alias sudo='nocorrect sudo'

# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcp='git cherry-pick -x'
alias ga='git add -A'
alias gap='git add -p'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git commit --amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git log'
alias glc='git log --graph --decorate --oneline --all'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gfa='git fetch --all'
alias gfap='git fetch --all --prune'
alias gd='git diff'
alias gb='git branch --verbose'
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git checkout -b'
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git tag -n'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Other aliases
alias v="vim"
alias s="sudo"
alias e="exit"
alias c="clear"
