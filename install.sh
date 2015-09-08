#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
while true; do
    read -p "Choose a seed name and cmd shortcut: " SEED
    if [ -z "$SEED" ]
    then
      echo "Please enter a seed name or press Ctrl-C to exit."
    else
      echo '#!/bin/bash\n\n home=$(pwd); cd '$SCRIPTPATH'; python siberianseed.py '$SEED' $*; cd $home' > /usr/local/bin/"$SEED";
      chmod 777 /usr/local/bin/"$SEED";
      break;
    fi
done