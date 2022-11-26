# <b>Example 1:</b>
- This compose file is taken from [Docker Compose Example 1](https://github.com/TheSpiritMan/DevOps-Tools/tree/main/03%20Docker/Lab7%20-%20Docker%20Compose/Lab7_01%20-%20Docker%20Compose%20File/Example%201) and made small change.
- There are 2 services in stack file. They are:   
    - <b>ubuntu-service</b>
    - <b>kali-service</b>

- Both services are replicated in 3 tasks.
- Ubuntu services are force to run in <b>manager</b> node i.e `master1` for our case.
- Kali services are force to run in <b>worker</b> node i.e `worker1`, `worker2`and `worker3`. Since 3 tasks are being created, so they are might be shared in one one node.

## <b>Deploy Stack</b>
- Deploy a stack named as `container`.

    <img src=../../../Assets/03_Docker_Lab10_E1-1.png>

- A new network for the stack is created under a stack name i.e `container_default`.
- Since there are 2 services in our YAML file, so 2 services are created. They are: 
    - <b>container_ubuntu-service</b>
    - <b>container_kali-service</b>

## <b>List Stack</b>

  <img src=../../../Assets/03_Docker_Lab10_E1-2.png>


## <b>List Services</b>

  <img src=../../../Assets/03_Docker_Lab10_E1-3.png>

## <b>List Tasks</b>

  <img src=../../../Assets/03_Docker_Lab10_E1-4.png>

- From above figure, we can see that ubuntu-service is running only in <b>master1</b> i.e <b>manager</b> node for our cluster.
- Also, the task of kali-service are distributed among <b>worker</b> node i.e <b>worker1</b>, <b>worker2</b> and <b>worker3</b>.
- If we want, we can get bash of any task.
  <img src=../../../Assets/03_Docker_Lab10_E1-5.png>

  
## <b>Scale Replicas</b>
- Scaling replicas is same way as from previos lab.

  <img src=../../../Assets/03_Docker_Lab10_E1-6.png>


## <b>Remove Stack</b>
    
<img src=../../../Assets/03_Docker_Lab10_E1-7.png>
