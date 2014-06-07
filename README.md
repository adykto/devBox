devBox
======

Setup the same LAMP + MEAN + Redis dev environment for all your team in minutes.

This will setup a vagrant box with

* Apache 2, PHP 5.4, NodeJS 0.10
* Composer, Jasmine, Karma, PhantomJS, PHP Unit, XDebug
* Git
* MySQL 5.5 server, MongoDB
* Wildcarded .dev hosts (any .dev domain will be served from /Public/DOMAIN/)
* The latest Mean.io stack

## Instructions

* Install VirtualBox and VagrantBox.
* Clone this repo into your dev folder.
* Create a folder called db/ inside your dev folder.
* Save your mysql database dump into db/seed.sql

### Ubuntu Linux and derivates (example)

```bash
$ sudo apt-get install vagrant virtualbox
$ git clone git@github.com:adykto/devBox.git
$ mkdir db
$ cp backup_mysql.sql db/seed.sql
```

### Windows

* Install PuTTY
* Import private key
* Install UTF-8 DejaVu Sans Mono font [Download](http://dejavu-fonts.org/wiki/Download)
* Activate PuTTY's support for xterm-256-color
* Activate PuTTY's attempt to use logical palettes
* Append VirtualBox's binaries to your PATH
* Open cmd.exe and run:

```bash
C:\> VBoxManage setextradata devbox.dev VBoxInternal2/SharedFoldersEnableSymlinksCreate//Public 1
```

Now, we can run our Puppet provisioner

```bash
$ vagrant up
```

And wait... a lot... xD

## So... what's going on next?

Edit your host machine to recognize all your .dev domains, appending 10.10.10.10 to /etc/hosts, and
navigate to it. For example using nano:

```bash
$ sudo echo 10.10.10.10 exampledomain.dev >> /etc/hosts
```

Now, you have a top-notch dev machine, like a boss!!!

### The end.
