#!/bin/sh

# Creates an empty app.

echo "Creating app in $root";

cd $root/src;
read -p "App name: " appname
if [ -z $appname ];
  then
    echo "Empty name given, exit"; exit 0; fi
if [ -d $appname ];
  then
    echo "Directory $appname already exists";
  else
    mkdir "$appname";
    mkdir -p "$root/bin/$appname";
    cp "$root/bin/"*.sh "$root/bin/$appname";
    for taskfile in "$root/bin/$appname"/*
    do
      taskname=$(basename "$taskfile");
      echo "#!/bin/sh\n\necho '[$appname]: $taskname';" > "$taskfile";
    done
    mkdir -p "$root/share/$appname";
    echo "App $appname created successfully";
fi
