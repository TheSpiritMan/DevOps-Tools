# Lab3- Reusing Playbooks
This Lab is same as [Lab2](https://github.com/TheSpiritMan/DevOps-Practice/tree/main/02%20Ansible/Lab2%20-%20Playbooks%20and%20Templates) but in a more organized ways.

This Lab is divided into 4 sub-folders. They are:
- [handlers](https://github.com/TheSpiritMan/DevOps-Practice/tree/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/handlers)
- [playbooks](https://github.com/TheSpiritMan/DevOps-Practice/tree/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/playbooks)
- [tasks](https://github.com/TheSpiritMan/DevOps-Practice/tree/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/tasks)
- [templates](https://github.com/TheSpiritMan/DevOps-Practice/tree/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/templates)

### handlers
This folder contains all the handlers used in playbook.
In this case we have only one handler i.e. [restart_apache2.yml](https://github.com/TheSpiritMan/DevOps-Practice/blob/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/handlers/restart_apache2.yml).

### playbooks
This folder contains all the playbook. In this case, we have 2 playbook. They are
- [install_playbook.yml](https://github.com/TheSpiritMan/DevOps-Practice/blob/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/playbooks/install_playbook.yml)
- [remove_playbook.yml](https://github.com/TheSpiritMan/DevOps-Practice/blob/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/playbooks/remove_playbook.yml)

### tasks
This folder contains all the task used in all the playbooks. For now, there are 4 tasks. They are:
- [install_apache2.yml](https://github.com/TheSpiritMan/DevOps-Practice/blob/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/tasks/install_apache2.yml)
- [install_mysql-server.yml](https://github.com/TheSpiritMan/DevOps-Practice/blob/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/tasks/install_mysql-server.yml)
- [remove_apache2.yml](https://github.com/TheSpiritMan/DevOps-Practice/blob/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/tasks/remove_apache2.yml)
- [remove_mysql-server.yml](https://github.com/TheSpiritMan/DevOps-Practice/blob/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/tasks/remove_mysql-server.yml)

### templates
This folder contains all the templates file. For now, there are 2 templates. They are:
- [index.html.j2](https://github.com/TheSpiritMan/DevOps-Practice/blob/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/templates/index.html.j2)
- [ports.conf.j2](https://github.com/TheSpiritMan/DevOps-Practice/blob/main/02%20Ansible/Lab3%20-%20Reusing%20Playbooks/templates/ports.conf.j2)  

## Access ansible-control
```
vagrant ssh anible-control
cd /vagrant/Lab3\ -\ Reusing\ Playbooks/
```

## Example 1: Install apache2 and mysql-server
Use following command:
```
ansible-playbook -i ../inventory  -K playbooks/install_playbook.yml
```
- `../inventory` is because `inventory` file is located 1 directory back.
- `install_playbook.yml` is playbook file.

Output:

<img src="../../Pictures/02_Ansible_Lab2-1.png" alt= "install playbook" style="display: inline-block; margin: 0 auto; max-width: 300px">

### Confirm Apache2 is running our html file.
- In `install_playbook.yml` file, we have a task to copy the `index.html` file in `/var/www/html` location.

### Command to check:
- For web01:
```
curl web01:8000
```
Output:
```
<html>
    <h1> Hello World! </h1>
</html>
```
- Do same for `web02`.

## Example 2: Remove apache2 and mysql-server
Use following command:
```
ansible-playbook -i ../inventory -K playbooks/remove_playbook.yml
```
- `remove_playbook.yml` is playbook file.

Output:

<img src="../../Pictures/02_Ansible_Lab2-2.png" alt= "remove playbook" style="display: inline-block; margin: 0 auto; max-width: 300px">



<h1>This is for Lab3- Reusing Playbooks.</h1>