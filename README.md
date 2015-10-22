SiberianSeed
============

**Minimalistic template for modular development** *from Siberia with love*


Say hello ![Bear says hello](https://dl.dropboxusercontent.com/u/45499397/bear_says_hello.jpg)
---------



SiberianSeed is probably the simpliest template ever.

**58** lines of a `seed` script will turn your development routine into a fairy tale.


Start using
-----------

 1. `git clone git@github.com:ilya-khaustov/siberianseed.git myApp && cd myApp`
 1. `sudo ./seed --new myApp --owner $(whoami)` Name your project and set a project owner.
 1. `echo 'printf "Hello world!";' > bin/hello.sh` Create a task.
 1. `myApp hello` Execute a task.


Go deeper
---------

 1. `mkdir bin/say`
 1. `echo 'printf "Bye $root!";' > bin/say/bye.sh` Variable `$root` is predefined. It contains absolute path of a project.
 1. `myApp say /bye` Slash-prefixed argument executes from `bin` subdirectory given as previous non-prefixed argument.
 1. `myApp hello say /bye` Execute a sequence.
 1. `myApp say /bye hello` Omit slash and execute directly from `bin`.
 1. `mv bin/hello.sh bin/say/hello.sh`
 1. `myApp say /hello /bye` This way it looks more consistent.


Reference
---------

### Imported variables
 1. `root` Seed-project path.
 1. `userpwd` PWD where `seed` script was called.


Tips and tricks
---------------

 * Type `. myApp` and `cd` to project root directory.
 * `myApp` redirects arguments to the `seed` script with additional `--name` argument. Executing `./seed --name myApp` from a project root is exactly the same as `myApp`.
 * Task name can include spaces. `myApp 'make a sandwich'` looks for `make a sandwich.sh` file inside a `bin` directory.
 * If project is moved to another directory the `seed` shortcut (`myApp` in this README) stops working. Execute `sudo ./seed --new myApp --owner $(whoami)` once again to fix it.
 * Tasks from a sequence are executed inside their child processes and can't interact with each other using shell variables or pipes. Tasks are supposed to interact through `share` directory. It is auto-created if not found on every task run. Save temporary data like logs, pid files or exported distributions inside `share` and access it later in subsequent tasks.
 * Pay attention to the `--owner` argument. It is strongly discouraged to make `root` a project owner. First, it is unsafe to run software like `bower` or `npm` with root privelegies. Second, files and folders created or processes started by root cause access errors when running tasks as a non-root user. Set project owner wisely to save your time and stay secure.
 * Use shebangs in tasks.


Batteries included!
-------------------

You could probably notice a bunch of files in the `bin` directory. Don't worry - they are only examples and `seed` doesn't depend on them. You can delete them in any moment if you feel right about it.

This README is as basic as it can be to keep things simple and decisions unbiased. However, if you would like to know more about developing practices, you are welcome to use existing tasks.