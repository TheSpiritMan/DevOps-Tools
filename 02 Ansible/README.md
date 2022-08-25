## Ansible Lab
- <b>Ansible</b> is a software tool that provides simple but powerful automation for cross-platform.
- It is used for application deployment, updates on workstations and servers, cloud provisioning, configuration management, intra-service orchestration, and nearly anything a systems administrator does on a weekly or daily basis.
- Ansible doesn't depend on agent software and has no additional security infrastructure, so it's easy to deploy.

### Working of Ansible
In Ansible, there are two categories of computers: 
`The Control node` and `Managed nodes`.

 - The control node is a computer that runs Ansible.
 - Ansible is known for it's agentless service which means ansible must not be   installed not in a slave node(managed node).
 - Ansible uses SSH key to authenticate.
 - Ansible makes a use of Playbook which is written in YAML script.
 - Ansible also use a inventory file which includes all the IP address and hostname of the machine.



 ## Installation of Ansible
 - Follow following command to install ansible in your Ubuntu distro.
```
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
 ```

 - If you are using another distro. Visit this [Link](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html) to follow official ansible documentaion.


### Tools Used In This Lab
- [Vagrant](https://github.com/TheSpiritMan/DevOps-Practice/tree/main/01%20Vagrant) from previous Lab.
- Linux Shell Scripting
- SSH Keygen
- Multiple VMs
- VirtualBox

### Project Case
- There is one `ansible-control` instance to manage all the `slave nodes`.
- There is one database instance.
- There are two web instances where same web application will be hosted.
- There is one loadbalancer(like nginx) to balance load in different web instance.

This is a final project in this Ansible practice. So we will do this project in multiple lab using different steps.


<b>Note</b>

 The `Vagrantfile` and `inventory` file for all the Labs are same. So they are available in [02 Ansible](https://github.com/TheSpiritMan/DevOps-Practice/tree/main/02%20Ansible) main directory.

 ### Vagrantfile
- We will use same `Vagrantfile` in all Ansible Lab.
- `Hostmanager` plugin is used in Vagrantfile which will automatically update the `/etc/hosts` file in all the VMs including our host machine.
- Command to install Hostmanager plugin: 
```vagrant plugin install vagrant-hostmanager ```
- To know more about hostmanager plugin. Visit this [link](https://www.rubydoc.info/gems/vagrant-hostmanager/1.2.3).