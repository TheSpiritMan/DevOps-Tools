# <b>Docker Swarm Initialization</b>
- This lab makes use of Vagrant, so visit [this link](https://github.com/TheSpiritMan/DevOps-Tools/tree/main/01%20Vagrant) to learn about <b>Vagrant</b>.

## <b>Vagrant File</b>
- `Vagrantfile` can be found for 2 types of Operating System. They are:
    - <b>Ubuntu 18.04</b>
    - <b>Centos/8-Stream</b>
- The shell script to install docker on the system can be found.
- Go through the Vagrantfile and make changes according to your choice.
- Bring up the Virtual machines. Command: 
    ```
    vagrant up
    ```
- <b>Vagrantfile</b> consists of 4 VMs. They are:
    - <b>Master1</b>
    - <b>Worker1</b>
    - <b>Worker2</b>
    - <b>Worker3</b>

- <b>Master</b> is for Manager node and <b>Workers</b> for Worker node in <b>Docker Swarm</b>.

- Once all the VMs are up and running properly. Get the secure shell for all the machine.

    Syntax:
        `vagrant ssh <hostname>`

    Example:
    - For `master1`: `vagrant ssh master1`
    - For `worker1`: `vagrant ssh worker1`
    - For `worker2`: `vagrant ssh worker2`
    - For `worker3`: `vagrant ssh worker3`
- Go to `/vagrant` folder, and run the script to install docker in the System.

## <b>Docker Swarm Initialization</b>
- Initiate a Docker Swarm in the Manager Node i.e `master1` for our case.
- Go to `master1`. 
    
    Syntax:  `docker swarm init --advertise-addr <VM_IP>`

    Command:
    ```
    docker swarm init --advertise-addr 192.168.57.6
    ```

    Output:
    <img src=../../../Assets/03_Docker_Lab9-1.png>

- `192.168.57.6` is a private IP for `master1` which is mentioned in `Vagrantfile`. If you want different IP then make a change in `Vagrantfile`.

- Get the information of the docker. Command: `docker info`

    Output:

    <img src=../../../Assets/03_Docker_Lab9-2.png>

- We can see that the Swarm is active and only one node is available at the moment i.e `master1`.
    
    <img src=../../../Assets/03_Docker_Lab9-3.png>

- List the `node` available in Swarm. Command:
    ```
    docker node ls
    ```

    Output:
    
    <img src=../../../Assets/03_Docker_Lab9-4.png>

## <b>Add Workers to the Cluster</b>
- Go to Workers Machine. They are:
    - <b>worker1</b>
    - <b>worker1</b>
    - <b>worker2</b>
    - <b>worker3</b>

- Join the <b>Workers</b> to the Swarm Cluster.
    Command:
    ```
    docker swarm join --token SWMTKN-1-64xo4ctdiw61qhgo0k8ztp4ha75pnp8io08ecqizn4jdm6krss-eyiwhylk8ja9b3wzuuw5w6dmg 192.168.57.6:2377
    ``` 

    Output:
    <img src=../../../Assets/03_Docker_Lab9-5.png>

- Do the same for all the workers.

## <b>Add Manager to the Cluster</b>
- If you want to add another manager node. Then go to `master1`. Command:
    ```
    docker swarm join-token manager
    ```
    <img src=../../../Assets/03_Docker_Lab9-6.png>

- Copy the outputted command from above and paste in the new machine to make it `manager` node.

- Once all the nodes are added to the cluster, go to `master1` and list all the nodes.

    Output:

    <img src=../../../Assets/03_Docker_Lab9-7.png>
    

## <b>Leave a Docker Swarm</b>
- If worker node wants to leave the `Docker Swarm`. Command:
    ```
    docker swarm leave
    ```
    Output:

    <img src=../../../Assets/03_Docker_Lab9-8.png>

- Since, `worker1` has left the Docker Swarm. Go to `master1` and list the node.

    Output:
    
    <img src=../../../Assets/03_Docker_Lab9-9.png>
    
- We can see that the node `worker1` is in <b>Down</b> Status.
- Now, `master1` has to remove the `worker1` from the cluster.
    Command:
    ```
    docker node rm worker1
    ```
    And list the node:

    <img src=../../../Assets/03_Docker_Lab9-10.png>

- Add the `worker1` as worker node yourself. And list all the node.

    Output:
    
    <img src=../../../Assets/03_Docker_Lab9-7.png>
