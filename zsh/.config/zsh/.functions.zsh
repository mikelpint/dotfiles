# Enable sshd if the system is Ubuntu on Windows
function wslsshd () {
    if ""echo $(uname -v) | grep -q Microsoft""
    then
                sudo service ssh start
                eval `ssh-agent -s`
                ssh-add
                clear
    fi
}

# Use Ctrl-x,Ctrl-l to get the output of the last command
function last-command () {
zmodload -i zsh/parameter
insert-last-command-output() {
LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey "^X^L" insert-last-command-output
}

# Show metadata of current song
function songmetadata {
    echo "Artist: $(playerctl metadata xesam:artist)"
    echo "Album: $(playerctl metadata xesam:album)"
    echo "Song: $(playerctl metadata xesam:title)"
}

# GitHub token
if [[ -f $HOME/.github_token ]]
then
  export GITHUB_TOKEN=$(cat $HOME/.github_token)
fi

# GitLab token
if [[ -f $HOME/.gitlab_token ]]
then
  export GITLAB_API_PRIVATE_TOKEN=$(cat $HOME/.gitlab_token)
fi
export GITLAB_API_ENDPOINT="https://gitlab.com/api/v3"

# ssh-agent at startup
if [[ -f $HOME/.ssh/id_ecdsa_sk ]]
then
    eval `keychain -q --agents ssh --eval id_ecdsa_sk --nogui`

elif [[ -f $HOME/.ssh/id_rsa  ]]
then
    eval `keychain -q --agents ssh --eval id_rsa --nogui`
fi
