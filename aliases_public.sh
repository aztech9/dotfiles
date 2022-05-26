#!/bin/bash

# thanks snowfag for prettying this up
pw() {
    cat /dev/urandom | tr -dc '[:print:]' | fold -w "${1:-32}" | head -n 1
}