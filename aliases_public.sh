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