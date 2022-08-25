## Lab2 Vagrantfile

Vagrantfile of this lab can be a bit difficult to understand at first. But following this README file can clear everything.



- `Vagrant.configure("2")do |config|` is the begineer line for every Vagrantfile. Here method is created with variable `config`.
As we can see, we are using the same ubuntu image that we have used in [Lab1](https://github.com/TheSpiritMan/DevOps-Project/tree/main/01%20Vagrant/Lab1).
- `config.vm.box = "ubuntu/xenial64"`: This command assigned the image name we will using.
- `config.vm.hostname = "box1"`: This command is used to give custom name to the box. This will help us to manage the box more easily.
- `config.vm.network "private_network", ip: "192.168.57.2"`: This is used to assigned private network to our box. The IP address here must be available in our `Virtualabox` network.
<img src="../../Pictures/01_Vagrant_Lab2-1.png" alt= "VirtualBox Network List" style="display: inline-block; margin: 0 auto; max-width: 300px">

- `config.vm.synced_folder "../Synced_folder", "/home/vagrant/Synced_folder"`: This is used to include any folder to be synced inside the vagrant box.

<b>Remember:</b> There is only one box in this Vagrantfile so the folder will only  synced with "box1". But in case of having multiple box in one single Vagrantfile, the folder will be synced with everybox.

- `config.vm.provision "file", source: "./Lab2_FileToCopy.txt", destination: "/home/vagrant/Copy_folder"`: This is used to copy any file outside the synced folder.

- `config.vm.provider :virtualbox do |vb|`: This is used to make changes in this virtualbox setting.

- `vb.name = "box1"`: This is used to name the machine in virtualbox. If this is not included, then virtualbox will assign random name to this box which will be difficult to manage.

- `config.vm.provider :virtualbox do |vb|`: This code assigned that we are using `virtualbox` as Vm provider. And we are again using method with variable `vb` to perform task.

- `vb.customize ["modifyvm", :id, "--memory", 1024]`: This is used to customized the vm resource according to our need. This will assign 1024MB memory for our Box  `box1`.    

- `vb.customize ["modifyvm", :id, "--cpus", 1]`: This will assign 1 core CPU  for our Box  `box1`.
- The method are close with the `end` command.


### Validate Vagrantfile 
Before running `vagrant up`, it is mandatory to run `vagrant validate` command to ensure every command is correct.

It checks for syntax error and also check for resources such as file to be copy is available or not and so many.
So, It is very good habit to run `vagrant validate` command before running `vagrant up`.

If everything is correct. It gives message saying `Vagrantfile validated successfully`.

### Running Vagrantfile 
Since there are no error with the code. We can finally run `vagrant up` command to start our task.

Remember it can take some time to complete task.

### Accessing Box using ssh
Since we have only one box in our Vagrantfile, we can simply use `vagrant ssh` command to login through ssh.

After logging through ssh, we get shell of the box. And we can do anything we like.

We can verify that our Synced_folder and copy files are located inside the vm.

### Extra Knowledge
We can find `/vagrant` folder inside that `box1`. This `/vagrant` folder is totally synced with the folder in which Vagrantfile is located.

### Destroy box
We can use `vagrant destroy` to destroy and delete all the vm using the same Vagrantfile.


<b>This is it for Lab2.</b>
