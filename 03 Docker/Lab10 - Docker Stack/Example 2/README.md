# <b>Example 2:</b>
- There are 3 services in stack file. They are:   
    - <b>simplilearn</b>
    - <b>nginx</b>
    - <b>nosk</b>
- All the services have multiple replicas.
- All the tasks are freed to be executed in any nodes.
- `simplilearn` is forwarded to `Port 8080`.
- `nginx` is forwarded to `Port 8081`.
- `nosk` is forwarded to `Port 8082`.

## <b>Deploy Stack</b>
- Deploy a stack named as `webapps`.

    <img src=../../../Assets/03_Docker_Lab10_E2-1.png>

- A new network for the stack is created under a stack name i.e <b>webapps_default</b>.
- Since there are 3 services in our YAML file, so 3 services are created. They are: 
    - <b>webapps_nginx</b>
    - <b>webapps_nosk</b>
    - <b>webapps_simplilearn</b>

## <b>List Stack</b>

  <img src=../../../Assets/03_Docker_Lab10_E2-2.png>

## <b>List Services</b>

  <img src=../../../Assets/03_Docker_Lab10_E2-3.png>

## <b>List Tasks</b>

  <img src=../../../Assets/03_Docker_Lab10_E2-4.png>

- From above figure, we can see that task are distributed among nodes.

## <b>Validate in Web Browser</b>
- <b>Visit Port 8080 for Simplilearn Project</b>

  <img src=../../../Assets/03_Docker_Lab10_E2-5.png>

- <b>Visit Port 8081 for Nginx</b>

  <img src=../../../Assets/03_Docker_Lab10_E2-6.png>

- <b>Visit Port 8082 for Nosk</b>
  <img src=../../../Assets/03_Docker_Lab10_E2-7.png>


- Our all the tasks are executed as planed.


## <b>Remove Stack</b>
    
<img src=../../../Assets/03_Docker_Lab10_E2-8.png>
