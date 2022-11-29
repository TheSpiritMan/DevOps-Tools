# <b>Example 4:</b>
- There are 2 services in stack file. They are:   
    - <b>mysql_docker</b>
    - <b>custom_app</b>
- <b>Remember: </b> The service name `mysql_docker` is used from the `application.properties` file of the application which can be found inthe [Github Page](https://github.com/TheSpiritMan/FirstCRUDApplication).
- `custom_app` service are freed to be executed in any <b>worker</b> node.
- The task of `mysql_docker` is set to be executed in <b>manager</b> node i.e `master1`.
- `custom_app` is forwarded to `Port 5555`.

## <b>Deploy Stack</b>
- Deploy a stack named as `crud`.

    <img src=../../../Assets/03_Docker_Lab10_E4-1.png>

- A new network for the stack is created under a stack name i.e <b>crud_default</b>.
- Since there are 2 services in our YAML file, so 2 services are created. They are: 
    - <b>crud_custom_app</b>
    - <b>crud_mysql_docker</b>

## <b>List Stack</b>

  <img src=../../../Assets/03_Docker_Lab10_E4-2.png>

## <b>List Services</b>
  <img src=../../../Assets/03_Docker_Lab10_E4-3.png>

## <b>List Tasks</b>

  <img src=../../../Assets/03_Docker_Lab10_E4-4.png>

- From above figure, we can see that `custom_app` tasks are available only in <b>worker</b> nodes. And `mysql_docker` task is in <b>master</b> node.


## <b>Validate in Web Browser</b>
- <b>Visit Port 5555 for Custom App</b>

  <img src=../../../Assets/03_Docker_Lab10_E4-5.png>
- <b>Remember: </b> It might takes some time to use our Environmental Variables in MySQL task. So wait some time after after services are running.
- If mysql connection is not set. Then page will not load.

- <b> Click on Manage User</b>

  <img src=../../../Assets/03_Docker_Lab10_E4-6.png>
    We can edit and delete if we want.

- <b> Add New User</b>

  <img src=../../../Assets/03_Docker_Lab10_E4-7.png>

    - Fill the form and save the details. Details will be saved in mysql database.
    - New user can be seen in the users list.
      <img src=../../../Assets/03_Docker_Lab10_E4-8.png>

## <b>Remove Stack</b>
    
<img src=../../../Assets/03_Docker_Lab10_E4-9.png>

