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
```
vagrant plugin install vagrant-hostmanager
```
- To know more about hostmanager plugin. Visit this [link](https://www.rubydoc.info/gems/vagrant-hostmanager/1.2.3).


### Ansible Help Menu
```
Usage: ansible <host-pattern> [options]

Define and run a single task 'playbook' against a set of hosts

Options:
  -a MODULE_ARGS, --args=MODULE_ARGS
                        module arguments
  --ask-vault-pass      ask for vault password
  -B SECONDS, --background=SECONDS
                        run asynchronously, failing after X seconds
                        (default=N/A)
  -C, --check           don't make any changes; instead, try to predict some
                        of the changes that may occur
  -D, --diff            when changing (small) files and templates, show the
                        differences in those files; works great with --check
  -e EXTRA_VARS, --extra-vars=EXTRA_VARS
                        set additional variables as key=value or YAML/JSON, if
                        filename prepend with @
  -f FORKS, --forks=FORKS
                        specify number of parallel processes to use
                        (default=5)
  -h, --help            show this help message and exit
  -i INVENTORY, --inventory=INVENTORY, --inventory-file=INVENTORY
                        specify inventory host path or comma separated host
                        list. --inventory-file is deprecated
  -l SUBSET, --limit=SUBSET
                        further limit selected hosts to an additional pattern
  --list-hosts          outputs a list of matching hosts; does not execute
                        anything else
  -m MODULE_NAME, --module-name=MODULE_NAME
                        module name to execute (default=command)
  -M MODULE_PATH, --module-path=MODULE_PATH
                        prepend colon-separated path(s) to module library
                        (default=[u'/home/vagrant/.ansible/plugins/modules',
                        u'/usr/share/ansible/plugins/modules'])
  -o, --one-line        condense output
  --playbook-dir=BASEDIR
                        Since this tool does not use playbooks, use this as a
                        subsitute playbook directory.This sets the relative
                        path for many features including roles/ group_vars/
                        etc.
  -P POLL_INTERVAL, --poll=POLL_INTERVAL
                        set the poll interval if using -B (default=15)
  --syntax-check        perform a syntax check on the playbook, but do not
                        execute it
  -t TREE, --tree=TREE  log output to this directory
  --vault-id=VAULT_IDS  the vault identity to use
  --vault-password-file=VAULT_PASSWORD_FILES
                        vault password file
  -v, --verbose         verbose mode (-vvv for more, -vvvv to enable
                        connection debugging)
  --version             show program's version number and exit

  Connection Options:
    control as whom and how to connect to hosts

    -k, --ask-pass      ask for connection password
    --private-key=PRIVATE_KEY_FILE, --key-file=PRIVATE_KEY_FILE
                        use this file to authenticate the connection
    -u REMOTE_USER, --user=REMOTE_USER
                        connect as this user (default=None)
    -c CONNECTION, --connection=CONNECTION
                        connection type to use (default=smart)
    -T TIMEOUT, --timeout=TIMEOUT
                        override the connection timeout in seconds
                        (default=10)
    --ssh-common-args=SSH_COMMON_ARGS
                        specify common arguments to pass to sftp/scp/ssh (e.g.
                        ProxyCommand)
    --sftp-extra-args=SFTP_EXTRA_ARGS
                        specify extra arguments to pass to sftp only (e.g. -f,
                        -l)
    --scp-extra-args=SCP_EXTRA_ARGS
                        specify extra arguments to pass to scp only (e.g. -l)
    --ssh-extra-args=SSH_EXTRA_ARGS
                        specify extra arguments to pass to ssh only (e.g. -R)

  Privilege Escalation Options:
    control how and which user you become as on target hosts

    -s, --sudo          run operations with sudo (nopasswd) (deprecated, use
                        become)
    -U SUDO_USER, --sudo-user=SUDO_USER
                        desired sudo user (default=root) (deprecated, use
                        become)
    -S, --su            run operations with su (deprecated, use become)
    -R SU_USER, --su-user=SU_USER
                        run operations with su as this user (default=None)
                        (deprecated, use become)
    -b, --become        run operations with become (does not imply password
                        prompting)
    --become-method=BECOME_METHOD
                        privilege escalation method to use (default=sudo),
                        valid choices: [ sudo | su | pbrun | pfexec | doas |
                        dzdo | ksu | runas | pmrun | enable ]
    --become-user=BECOME_USER
                        run operations as this user (default=root)
    --ask-sudo-pass     ask for sudo password (deprecated, use become)
    --ask-su-pass       ask for su password (deprecated, use become)
    -K, --ask-become-pass
                        ask for privilege escalation password

Some modules do not make sense in Ad-Hoc (include, meta, etc)
```