## Vagrant Lab

Vagrant is <b>Infrastructure as code</b>. It is used to manage hardware resources with the help of a code.
It is mostly use to test our operation locally before uploading in the server.

It uses a Virtualbox.

So before using it you must have `virtualBox` in your system.

Visit this [Link](https://www.vagrantup.com/downloads) to install the vagrant in your machine.


### Getting Started
Vagrant make a use of image to download and run on VirtualBox to make everything easy. Every Vagrant container can be found publicly in [Vagrant Cloud](https://app.vagrantup.com/boxes/search).


Hashicorp Provide Getting-Started tutorial for Vagrant. Click this [link](https://learn.hashicorp.com/collections/vagrant/getting-started) to visit the page.

<b>Remember:</b> Hashicorp is a company that provide Vagrant. So you will have to create account in Hashicorp main website not on vagrant.

<b> Every thing will be divided into Lab. </b>


### Useful vagrant command

```
Usage: vagrant [options] <command> [<args>]

    -h, --help                       Print this help.

Common commands:
     autocomplete    manages autocomplete installation on host
     box             manages boxes: installation, removal, etc.
     cloud           manages everything related to Vagrant Cloud
     destroy         stops and deletes all traces of the vagrant machine
     global-status   outputs status Vagrant environments for this user
     halt            stops the vagrant machine
     help            shows the help for a subcommand
     init            initializes a new Vagrant environment by creating a Vagrantfile
     login           
     package         packages a running vagrant environment into a box
     plugin          manages plugins: install, uninstall, update, etc.
     port            displays information about guest port mappings
     powershell      connects to machine via powershell remoting
     provision       provisions the vagrant machine
     push            deploys code in this environment to a configured destination
     rdp             connects to machine via RDP
     reload          restarts vagrant machine, loads new Vagrantfile configuration
     resume          resume a suspended vagrant machine
     snapshot        manages snapshots: saving, restoring, etc.
     ssh             connects to machine via SSH
     ssh-config      outputs OpenSSH valid configuration to connect to the machine
     status          outputs status of the vagrant machine
     suspend         suspends the machine
     up              starts and provisions the vagrant environment
     upload          upload to machine via communicator
     validate        validates the Vagrantfile
     version         prints current and latest Vagrant version
     winrm           executes commands on a machine via WinRM
     winrm-config    outputs WinRM configuration to connect to the machine
```
