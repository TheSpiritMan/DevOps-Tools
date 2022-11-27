# <b>Example 3:</b>
- There are 2 services in stack file. They are:   
    - <b>db</b>
    - <b>wordpress</b>
- `Wordpress` service is set on global service mode.
- All the tasks of `db` are freed to be executed in any nodes.
- `Wordpress` is forwarded to `Port 8080`.

## <b>Deploy Stack</b>
- Deploy a stack named as `wordpress-apps`.

    <img src=../../../Assets/03_Docker_Lab10_E3-1.png>

- A new network for the stack is created under a stack name i.e <b>wordpress-apps_default</b>.
- Since there are 2 services in our YAML file, so 2 services are created. They are: 
    - <b>wordpress-apps_db</b>
    - <b>wordpress-apps_wordpress</b>

## <b>List Stack</b>

  <img src=../../../Assets/03_Docker_Lab10_E3-2.png>

## <b>List Services</b>
  <img src=../../../Assets/03_Docker_Lab10_E3-3.png>

## <b>List Tasks</b>

  <img src=../../../Assets/03_Docker_Lab10_E3-4.png>

- From above figure, we can see that `wordpress` tasks are available only in <b>worker</b> nodes. And `db` tasks are distributed among random nodes.


## <b>Validate in Web Browser</b>
- <b>Visit Port 8080 for Wordpress</b>

  <img src=../../../Assets/03_Docker_Lab10_E3-5.png>

- Now, we can use wordpress in our swarm.
- <b>Remember: </b> It might takes some time to use our Environmental Variables in MySQL task. So wait some time after after services are running.
- If mysql connection is not set. Then <b>Connection not established</b> error is displayed.

## <b>Remove Stack</b>
    
<img src=../../../Assets/03_Docker_Lab10_E3-6.png>

