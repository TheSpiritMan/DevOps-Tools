### Lab1 Ansible
- In this Lab, we simply run the `vagrant up` command to start our VMs instances.

### Install Ansible
- Once everything is up and working. Hop into `ansible-control` VM using `vagrant ssh ansible-control` command.
- Then install `ansible` in this VM.
- Command to install: 
```
sudo apt-get install ansible
``` 
- Remember `ansible-control` is our master node for ansible. So ansible must only install in this VM.

### Requirement for Ansible
- Ansible uses inventory for performing it's operation.
- By default, the inventory file is located in `/etc/ansible/hosts`.
- We can also use our custom inventory file and must use `-i` flag to locate inventory file.
- Ansible can use playbook and ad-hoc command for task.

### Ad-hoc command
- Ansible uses differnet module for different task and `-m` flag is used for module.
- Example of ad-hoc command using `command` module:
```
ansible localhost -m command -a hostname
```
- In above example:
    `ansible` itself is tool.
    `localhost` is a pre-defined for 127.0.0.1.
    `-m` flag is for module.
    `command` is a module name use for using command.
    `-a` flag is for starting of command.
    `hostname` is a command.
- Output will be something like this:
```
localhost | SUCCESS | rc=0 >>
ansible-control 
```
- This output shows ansible is working correctly.

### SSH Keygen
- Command to generate ssh key is:
```
ssh-keygen
```
- Press enter. And leave default setting for everything.
- Test ssh key in localhost. For that copy the ssh key in localhost. Command for that is:
```
ssh-copy-id localhost
```
<b>Note: </b> 

By default, the password for all the vagrant machine is `vagrant`.
- Once successfully copied ssh key.Then test for ssh connection using command:
```
ssh localhost
```
- Then we can see, we get new ssh connection. We can verify and exit than session.

### Copy SSH key to all other servers.
- Now we can copy ssh key in all the VM instances.
- Command to copy:
```
ssh-copy-id web01 && ssh-copy-id web02 && ssh-copy-id db01 && ssh-copy-id loadbalancer
```
- The password for all the VM instances is `vagrant`.

### Running ansible command for all the VMs
- Move to `/vagrant` in `ansible-control` VM.
```
ansible all -i inventory -m command -a hostname
```
- In above example:
    `ansible` itself is tool.
    `all` means all the VM instances within inventory file.
    `-i` flag is for custom inventory file.
    `inventory` is inventory file name.
    `-m` flag is for module.
    `command` is a module name use for using command.
    `-a` flag is for starting of command.
    `hostname` is a command.

- Output will be something like this:
```
web02 | SUCCESS | rc=0 >>
web02

loadbalancer | SUCCESS | rc=0 >>
loadbalancer

web01 | SUCCESS | rc=0 >>
web01

db01 | SUCCESS | rc=0 >>
db01

ansible-control | SUCCESS | rc=0 >>
ansible-control
```
- This shows `ansible-control` instance can access all other instances.



### Install services using apt module
The official documentation of the apt module can be found in this [link](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html).

Example 1:
```
ansible slave -i inventory --become -m apt -a "update_cache=yes"
```
- `update_cache=yes` is for `apt update`.
- `slave` is group of all the `managed node` instances.
- `--become` is for `sudo` privillege task.

Output:
```
db01 | SUCCESS => {
    "cache_update_time": 1661430097, 
    "cache_updated": true, 
    "changed": true
}
web01 | SUCCESS => {
    "cache_update_time": 1661430085, 
    "cache_updated": true, 
    "changed": true
}
web02 | SUCCESS => {
    "cache_update_time": 1661430090, 
    "cache_updated": true, 
    "changed": true
}
loadbalancer | SUCCESS => {
    "cache_update_time": 1661430048, 
    "cache_updated": true, 
    "changed": true
}
```

Example 2:
```
ansible webservers -i inventory --become -m apt -a "name=apache2 state=present"
```
- `name=apache2 state=present` is for `apt install apache2`.
- `webservers` is a group for `web01` and `web02` VM instances.
- `--become` is for `sudo` privillege task.

Output:
```

```

Example 3:
```
ansible databases -i inventory--become -mapt -a "name=mysql-server state=present"
```
- `name=mysql-server state=present` is for `apt install mysql-server`
- `databases` is for db01 VM instances.
- `--become` is for sudo privillege task.

Output:
```
```