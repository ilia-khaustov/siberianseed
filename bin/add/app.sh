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
    for task in $(ls "$root/bin/"*.sh);
      do echo $task; echo "#!/bin/sh\n\necho '[$appname]: $task';" > "$root/bin/$appname/$task";
    done
    mkdir -p "$root/share/$appname";
    echo "App $appname created successfully";
fi
