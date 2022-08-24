## Lab2 Vagrantfile

Vagrantfile of this lab can be a bit difficult to understand at first. But following this README file, everything can be clear.

As we can see, we are using the same ubuntu image that we have used in [Lab1]().
- `config.vm.box = "ubuntu/xenial64"`: This command assigned the image name we will using.
- `config.vm.hostname = "box1"`: This command is used to give our custom name to the box. This will help us to manage the box more easily.
- `config.vm.network "private_network", ip: "192.168.57.2"`: This is used to assigned private network to our box. The IP address here must be available in your <b>Virtualabox</b> network.
    <img src="../Pictures/Lab2-1.png" alt= "VirtualBox Network List" style="display: inline-block; margin: 0 auto; max-width: 300px">