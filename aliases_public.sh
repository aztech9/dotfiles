#!/bin/bash

webhook() {
    if [ $# -lt 2 ]; then
        echo "usage: <username> <message_content> [url]"
        echo "webhook url defaults to \$URL ($URL) if no url parameter is given"
        return -1;
    fi;
    curl -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"username\": \"$1\", \"content\": \"$2\"}" "${3:-$URL}"
}

# thanks snowfag for prettying this up
pw() {
    cat /dev/urandom | tr -dc '[:print:]' | fold -w "${1:-32}" | head -n 1
}

# for git
source ~/dotfiles/ssh_agent.sh

# if you want to use your own port or
# pass any args to ssh-copy-id, add at before the host
# ex: sshadd -p 1337 aztech@root.com
# dont blame me blame ssh-copy-id author.

alias sshadd="ssh-copy-id -i ~/.ssh/id_ed25519.pub"
alias rebuild_hosts="~/dotfiles/rebuild_hosts.sh"

if [ ! -f ~/dotfiles/hosts.sh ]; then
    source ~/dotfiles/rebuild_hosts.sh
else
    source ~/dotfiles/hosts.sh
fi;
