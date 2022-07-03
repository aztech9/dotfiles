#!/bin/bash
# export your url as a variable. ofc if you have aliases_private.sh... this is already included!!!!

source ~/dotfiles/aliases_public.sh
webhook "transmission" "A torrent has finished downloading\\ndirectory: $TR_TORRENT_DIR\\nname: $TR_TORRENT_NAME"
