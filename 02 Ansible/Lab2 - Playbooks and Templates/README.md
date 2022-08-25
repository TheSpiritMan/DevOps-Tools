# Lab2 - Playbook and Templates

## Playbook
- Using `ad-hoc` command for a small task is easy. But using it for multiple tasks is not easy.
- So Ansible makes a use of playbook which simply is a [YAML]() script containing multiple tasks.
- Playbook for this Lab2 can be found in [playbook.yml]() file.
- In `playbook.yml` file, there are 2 hosts: `webservers` and `databases`.
- Everything can be easily understood except `template` ,`notify` and `handlers`. 

### Template
- Template such as Ninja which file extension is `.j2` can be used for a ansible task.
- Two templates are used in this Lab. They can be found inside [templates]() folder.
- Template includes two key-value pairs. They are `src` for source and `dest` for destination.

### Notify
- `notify` is which to trigger handler.
- Notify includes String which must match with `handler` name to trigger handler.
- Notify is called only when it's task is completed.

### Handler
- `handlers` can only be triggerred when `notify` is successfully called.
- `name` of handlers must match with `notify`. 



## Command to run playbook
```
ansible-playbook -i $inventoryFile -K $playbookFile
```
- `ansible-playbook` is for playbook.
- `-i` flag is for inventory file
- `$inventoryFile` is name for inventory file.
- `-K` flag is for playbook.
- `$playbookFile` is name for playbook file.

## Access ansible-control
```
vagrant ssh anible-control
cd /vagrant/Lab2\ -\ Playbooks\ and\ Templates/
```

## Run Playbook
To run this lab2 successfully. Use following command:
```
ansible-playbook -i ../inventory  -K playbook.yml
```
- `../inventory` is because `inventory` file is located 1 directory back.
- `playbook.yml` is playbook file name.

Output:
```
PLAY [webservers] ********************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************
ok: [web01]
ok: [web02]

TASK [ensure apache2 is at latest version] *******************************************************************************************
changed: [web01]
changed: [web02]

TASK [write the apache2 ports.conf config file] **************************************************************************************
ok: [web02]
ok: [web01]

TASK [write a basic index.html file] *************************************************************************************************
changed: [web01]
changed: [web02]                                                                                                                      
                                                                                                                                      
TASK [ensure apache2 is running] *****************************************************************************************************
ok: [web01]
ok: [web02]

RUNNING HANDLER [restart apache2] ****************************************************************************************************
changed: [web01]
changed: [web02]

PLAY [databases] *********************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************
ok: [db01]

TASK [install mysql-server latest version] *******************************************************************************************
changed: [db01]

TASK [ensure mysql-server is running] ************************************************************************************************
ok: [db01]

PLAY RECAP ***************************************************************************************************************************
db01                       : ok=3    changed=1    unreachable=0    failed=0   
web01                      : ok=6    changed=3    unreachable=0    failed=0   
web02                      : ok=6    changed=3    unreachable=0    failed=0
```


<h1>This is for Lab2- Playbook and Templates.</h1>