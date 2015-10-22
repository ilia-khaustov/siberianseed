#!/bin/sh

# Creates a new seed-project

echo "Creating seed-project in $userpwd";
cd $userpwd;

read -p "Project directory: " newdir
if [ -z $newdir ];
  then
    echo "Empty directory given, exit"; exit 0; fi
if [ -d $newdir ];
  then
    echo "Directory $newdir already exists";
    exit 0;
fi

read -p "Project shortcut: " newcmd
if [ -z $newcmd ];
  then
    echo "Empty shortcut given, exit"; exit 0; fi

git clone git@github.com:ilya-khaustov/siberianseed.git $newdir;
cd $newdir;
sudo ./seed --new $newcmd --owner $(whoami);
rm -rf .git;
mv README.md SIBERIANSEED.md;
rm LICENSE.md;
echo "Project $newdir created successfully";
