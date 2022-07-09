#!/bin/bash
if [ ! -f ~/dotfiles/hosts.sh ]; then
  touch ~/dotfiles/hosts.sh
  chmod +x ~/dotfiles/hosts.sh
fi;

echo "#!/bin/bash" > ~/dotfiles/hosts.sh

while read -ra arr; do
  echo -n "alias ${arr[0]}='ssh ${arr[1]/':'/' -p '}" >> ~/dotfiles/hosts.sh
  [ "${#arr[@]}" -gt 2 ] && echo -n " ${arr[@]:2}" >>  ~/dotfiles/hosts.sh
  echo  \' >> ~/dotfiles/hosts.sh
done < ~/dotfiles/hosts.txt

source ~/dotfiles/hosts.sh
