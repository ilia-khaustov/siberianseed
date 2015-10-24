#!/bin/sh

# Creates a new seed-project

echo "Creating seed-project in $userpwd";
cd "$userpwd";

read -p "Project full name: " newdir
if [ -z "$newdir" ];
  then
    echo "Empty name given, exit"; exit 0; fi
if [ -d "$newdir" ];
  then
    echo "Directory $newdir already exists";
    exit 0;
fi

read -p "Project shortcut: " newcmd
if [ -z "$newcmd" ];
  then
    echo "Empty shortcut given, exit"; exit 0; fi

git clone git@github.com:ilya-khaustov/siberianseed.git "$newdir";
cd "$newdir";
sudo ./seed --new "$newcmd" --owner $(whoami);
rm -rf .git;
mv README.md SIBERIANSEED.md;
rm LICENSE.md;
touch README.md;
echo "# $newdir\n\n" >> README.md;
echo "## Install\n" >> README.md;
echo " 1. \`sudo ./seed --new $newcmd --owner \$(whoami)\`" >> README.md;
echo " 2. \`$newcmd install\`" >> README.md;
echo "Project $newdir created successfully";
