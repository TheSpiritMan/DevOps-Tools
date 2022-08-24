## Lab4 
In Lab4, we are practicing about the provisioning script.
This is bash script which is made to run on terminal while building our VM for the first time.

This script only run one time that is only when using command `vagrant up`.
Since it will be running our script, so it will take some time to function according to our code.


### Webpage Hosting
Here we have a simple `index.html` file. We are about tob host it inside the `apache2` server in ubuntu box.

### Shell Script
`host_webpage.sh` file contains all the script for our job. We will use this script in `Vagrantfile` to make it run automatically.

- `config.vm.provision :shell, path: "host_webpage.sh"`:This command is use to use the script in provision state.


### Things Similar To Previos Lab
- `vagrant validate` to validate Vagrantfile
- `vagrant up` to start the build
- `vagrant destroy` to destroy the VM

### Confirm it within the VM 
Once our VM build successfully, we can `ssh`  into the box using `vagrant ssh` since there is only one box in the Vagrantfile.

Then we can use `wget -qO- 127.0.0.1` to view the webpage in our terminal.

### Confirm Port Forwading
Since we have all forwarded the port `80` of VM into port `8080` of our local machine.

Using `wget -qO- 127.0.0.1:8080` in our local machine must give us same result.

We can include any shell script in our bash-script file.

So, this is it for Lab4.