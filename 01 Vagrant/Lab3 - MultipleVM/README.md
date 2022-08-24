## Lab3 Vagrantfile
In [Lab2](https://github.com/TheSpiritMan/DevOps-Project/tree/main/01%20Vagrant/Lab2%20-%20More%20Advanced%20Vagrantfile), we added some provision for the VM Box.
But here we will try same provision technique but in multiple VM using single `Vagrantfile`.

In the above `Vagrantfile`, we can see that there are 2 box present.
So this Vagrantfile is for multiple VM.

Everything is same in above Vagrantfile as of Lab2 but for 2 different machine.

In this lab, we have used two different image. They are:
    - Ubuntu/xenial6
    - Centos/7


### Things same as [Lab2](https://github.com/TheSpiritMan/DevOps-Project/tree/main/01%20Vagrant/Lab2)
- `vagrant validate` to validate Vagrantfile
- `vagrant up` to start the build
- `vagrant destroy` to destroy the VM

### Accessing Box using ssh
However the other method are same to build and destroy the VM but assessing the box through ssh is a little bit different.

<b>Note:</b> 

In [Lab2](https://github.com/TheSpiritMan/DevOps-Project/tree/main/01%20Vagrant/Lab2), there was only one VM present so we can simply use the command `vagrant ssh` to get ssh connection.

But in this case, there are 2 VMs available. So to access VM through ssh, we need to know the VM name.

As our VM are named as `vm1` and `vm2`, we must use following command to access VM through ssh:
`vagrant ssh vm1`: For vm1
`vagrant ssh vm2`: For vm2


### Networking Concept
As we know, these 2 VMs are on same network. So they can ping eachother without any configuration.

To check connectivity, try following steps:
- Step 1: `vagrant ssh vm1` to get ssh connection for VM1.
- Step 2: `ping 192.168.57.4`.
- Step 3: Follow same from VM2.

<b>This is for Lab3.</b>