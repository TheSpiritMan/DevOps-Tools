## Lab1 Vagrantfile
We can automatically create Vagrantfile using following command:
```
vagrant init ubuntu/xenial64
vagrant up
``` 
- In above code, `vagrant init` is a prefix and `ubuntu/xenial64` is image name which can be found in Vagrant Cloud.
- `vagrant up` is used to build the box and run it.

We can also create Vagrantfile manually which is more convenient way to do because we will be needing more custom code than automatic.
```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
end
```
- The above code must be inside Vagrantfile. And using `vagrant up` will initiate the build.