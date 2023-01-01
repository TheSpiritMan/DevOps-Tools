# Lab4- Ansible Roles, Ansible Galaxy and Tags
This Lab is upgraded version of [Lab3](https://github.com/TheSpiritMan/DevOps-Practice/tree/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks) with the help of ansible roles, ansible-galaxy and tags.

## Ansible Roles
Roles let you automatically load related vars, files, tasks, handlers, and other Ansible artifacts based on a known file structure. After you group your content in roles, you can easily reuse them and share them with other users.
If you want to know more about Ansible Roles visit this [link](https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html).


Command:
```
ansible-galaxy init roles/$Role_Name
```
- `ansible-galaxy` tool is used to create roles.
- `init` will initialize
- `roles` is sub-directory for all the roles
- `$RoleName` is custom role name

## Roles Directory Structure
<img src="../../Assets/02_Ansible_Lab4-roles_demo.png">

- Defaults: Default variables for the role
- Files: Contains files to copy to destination
- Handlers: Based on notify do something specified
- Meta: Mata data about current role
- Tasks: List of tasks to be executed by the role
- Templates: Template files to copy
- Test: If you want additional verification of your build
- Vars: Other variables for the role

<h1>Note: </h1>

`main.yml` file is main file which must includes all the necessary custom YAML files.

## Ansible Galaxy 
Ansible galaxy is a tool which is used to create roles.

## Tags
Tags are a word assigned with the tasks which help to manage machine using single playbook.
This means we do not have to create separate playbook to install and remove packages or any other tasks. We can do using one playbook with the helps of `tags`.
- We can also use multiple tags for a single task.

## Access ansible-control
```
vagrant up
vagrant ssh anible-control
cd /vagrant/Lab4-\ Ansible\ Role\ and\ Ansible\ Galaxy/
```

## Create Roles
We need total 3 roles for now. They are:
- `apache2`: To install and remove apache2.
- `nginx`: To install and remove nginx.
- `database`: To install and remove mysql-server.

Command to create `apache2` role:
```
ansible-galaxy init roles/apache2
```
It must create the `apache2` role.

<img src="../../Assets/02_Ansible_Lab4-apache2_role.png">

Now create roles for `nginx` and `database` by yourself.

<img src="../../Assets/02_Ansible_Lab4-nginx_role.png">
<img src="../../Assets/02_Ansible_Lab4-database_role.png">


## Example 1: List all the tags used in the playbook
Command:
```
ansible-playbook -i ../inventory -K playbooks/playbook.yml --list-tags
```

Output:
```
playbook: playbooks/playbook.yml

  play #1 (webservers): webservers      TAGS: [webservers]
      TASK TAGS: [always, configuration, installation, removing, webservers]

  play #2 (proxy): proxy        TAGS: [proxy]
      TASK TAGS: [configuration, installation, proxy]

  play #3 (databases): databases        TAGS: [databases]
      TASK TAGS: [configuration, databases, installation, removing]
```

## Example 2: Install packages using installation tag
Command:
```
ansible-playbook -i ../inventory -K playbooks/playbook.yml --tags installation
```
Output:
```
PLAY [webservers] *******************************************************************

TASK [Gathering Facts] *********************************************************************
ok: [web01]
ok: [web02]

TASK [apache2 : install apache2] **********************************************************
ok: [web02]
changed: [web01]
                                                                                                                                      
TASK [apache2 : write apache2 ports.conf file] ********************************************
ok: [web02]                                                                                                                           
ok: [web01]                                                                                                                           
                                                                                                                                      
TASK [apache2 : write basic html file] **************************************************
changed: [web01]                                                                                                                      
changed: [web02]                                                                                                                      
                                                                                                                                      
TASK [apache2 : ensure apache2 is running] ************************************************
ok: [web01]                                                                                                                           
ok: [web02]                                                                                                                           
                                                                                                                                      
RUNNING HANDLER [apache2 : restart apache2] **********************************************
changed: [web01]                                                                                                                      
changed: [web02]                                                                                                                      
                                                                                                                                      
PLAY [proxy] ***************************************************************************
                                                                                                                                      
TASK [Gathering Facts] *******************************************************************
ok: [loadbalancer]                                                                                                                    

TASK [nginx : install nginx] **************************************************************
changed: [loadbalancer]

TASK [nginx : deploy nginx] *************************************************************
changed: [loadbalancer]

TASK [nginx : remove defaults] ******************************************************************************************
changed: [loadbalancer]

RUNNING HANDLER [nginx : restart nginx] ***************************************************
changed: [loadbalancer]

PLAY [databases] ***************************************************************************

TASK [Gathering Facts] *********************************************************************
ok: [db01]

TASK [database : install mysql-server] *****************************************************
changed: [db01]

TASK [database : ensure mysql-server is running] ********************************************
ok: [db01]

PLAY RECAP **********************************************************************************
db01                       : ok=3    changed=1    unreachable=0    failed=0   
loadbalancer               : ok=5    changed=4    unreachable=0    failed=0   
web01                      : ok=6    changed=3    unreachable=0    failed=0   
web02                      : ok=6    changed=2    unreachable=0    failed=0   
```

### Check loadbalancer
Command:
```
curl http://loadbalancer
```
Output:
```
<html>
    <h1> Hello world! </h1>
</html>
```

<h1>Note:</h1>

In previous lab, we were directly accesing the web hosting from main instances like `web01` and `web02`. But now loadbalancer does the job of balancing load. So we can do curl to `port 80` of `loadbalancer`.


## Example 3: Remove package using removing tag
Command:
```
ansible-playbook -i ../inventory -K playbooks/playbook.yml --tags removing
```
Output:
```
PLAY [webservers] ***********************************************************

TASK [Gathering Facts] ********************************************************
ok: [web01]
ok: [web02]

TASK [apache2 : remove apache2] **************************************************
changed: [web01]
changed: [web02]

TASK [apache2 : remove ports.conf] ****************************************************
changed: [web01]
changed: [web02]

TASK [apache2 : remove index file] *****************************************************
changed: [web01]
changed: [web02]

PLAY [proxy] *************************************************************************

TASK [Gathering Facts] **************************************************************
ok: [loadbalancer]

TASK [nginx : remove nginx] *********************************************************
changed: [loadbalancer]

TASK [nginx : remove mysite] ***********************************************************
changed: [loadbalancer]

PLAY [databases] *********************************************************************

TASK [Gathering Facts] ****************************************************************
ok: [db01]

TASK [database : remove mysql-server] ************************************************
changed: [db01]

PLAY RECAP ***********************************************************************
db01                       : ok=2    changed=1    unreachable=0    failed=0   
loadbalancer               : ok=3    changed=2    unreachable=0    failed=0   
web01                      : ok=4    changed=3    unreachable=0    failed=0   
web02                      : ok=4    changed=3    unreachable=0    failed=0   
```



<h1>This much is for Lab 4.</h1>
