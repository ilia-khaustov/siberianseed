SiberianSeed
============

**Boilerplate for modular development** *from Siberia with love* ![Bear says hello](https://dl.dropboxusercontent.com/u/45499397/bear_says_hello.jpg)

Overview
--------

SiberianSeed consists of:
  
  * **.** - root-project
  * **apps** - self-sufficient projects built into the root-project as modules
  * **tasks.json** - router configuration for running root tasks
  * **define.json** - user-defined shell variables for tasks
  * **utils.json** - fast access to useful shell commands
  * **siberianseed.py** - interactive tool for project administration
  * **install.sh** - installation script that creates a custom shortcut for siberianseed.py


```
siberianseed
├── apps
│   ├── sampleApp
│   │   ├── src
│   │   ├── bin
│   │   └── share
│   └── ...
│   ...
│
├── tasks.json
├── define.json
├── siberianseed.py
├── install.sh
└── .gitignore
```

### apps

Each app has unique name and predefined folder structure to one level.

#### app/src

Container for an application without predefined structure or shared dependencies. Developer is free to choose his favourite language, framework, compilers and build/testing/linting/whatevering systems inside this folder.

#### app/bin

Shell scripts that are executed inside app **src** directory.

#### app/share

Compiled source, binaries, generated data or other files that should be shared to other apps. File structure is defined by team convention. Share folders are included in .gitignore: `apps/*/share/**`.

### tasks.json

Routing to apps tasks is straight-forward.

```
{

  "build": [
  
    // subtask consists of one or more app tasks which run concurrently
    { 
      // runner looks for apps/api/bin/install.sh script
      // script is executed inside apps/api/src folder
      // if return code is not 0 execution breaks with error
      "api": ["install"],
      "website": ["install"]
    },
    
    // every subtask waits for previous subtasks to finish
    { 
      "api": ["configure", "migrate"],
      "website": ["configure", "minify"]
    }

  ],

  "serve": [

    // subtask can refer to existing root task
    "build",

    { "api": ["serve"] },

    { "website": ["serve"] }

  ]
  
}
```

Using
-----

### Installing

Run as root `./install.sh` to create custom cmd-shortcut.

**Tip**: reinstall if seed directory changes

### Common commands

 * `<cmd>` lists apps, apps tasks, root tasks, checks consistency
 * `<cmd> run` shows available root tasks (from map.json)
 * `<cmd> run <task>` runs root task (from map.json)
 * `<cmd> app` shows apps and their tasks
 * `<cmd> app <app>` bootstraps empty app in apps folder or shows existing app
 * `<cmd> app <app> <task>` runs app task (from `bin` folder)
 * `<cmd> util <util>` runs util from `utils.json`

### Writing app tasks

Each app task is a shell script that runs from app's src folder.

Task has default predefined variables:

 * `$root` - root-project absolute file path
 * `$app_{name}` - "$root"/apps/{name}/share

Additional variables can be added via define.json:

```
{
  "api": {
    "port_dev": 1337,
    "port_prod": 80
  }
}
```

They will be injected in shell scripts for *api* app as `$port_dev` and `$port_prod`.

### Running utils

You can add often used shell commands to utils.json and run them with `<cmd> util <util>`.
