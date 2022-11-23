# <b>Lab9: Docker Swarm </b>
- Docker Swarm is an orchestration management tool that runs on Docker applications.
- It helps end-users in creating and deploying a cluster of Docker nodes.
- Each node of a Docker Swarm is a Docker daemon, and all Docker daemons interact using the Docker API.
- Each container within the Swarm can be deployed and accessed by nodes of the same cluster. 

## <b>Features Of Docker Swarm</b>
- <b>Decentralized access:</b> Swarm makes it very easy for teams to access and manage the environment.
- <b>High security:</b> Any communication between the manager and client nodes within the Swarm is highly secure.
- <b>Autoload balancing:</b> There is autoload balancing within your environment, and you can script that into how you write out and structure the Swarm environment.
- <b>High scalability:</b> Load balancing converts the Swarm environment into a highly scalable infrastructure.
- <b>Roll-back a task:</b> Swarm allows you to roll back environments to previous safe environments.

## <b>Swarm Mode Key Concepts:</b>
- <b>Service and Tasks:</b>
    - Docker containers are launched using services.
    - Services can be deployed in two different ways - <b>global</b> and <b>replicated</b>.
    - <b>Global services</b> are responsible for monitoring containers that want to run on a Swarm node.
    - <b>Replicated services</b> specify the number of identical tasks that a developer requires on the host machine.
    - <b>Services</b> enable developers to scale their applications.
    - Before deploying a service in Swarm, the developer should implement at least a single node.
    - Services can be used and accessed by any node of the same cluster.
    - A service is a description of a task, whereas a task performs the work.
    - Docker helps a developer in creating services, which can start tasks. However, when a task is assigned to a node, the same task cannot be attributed to another node.

- <b>Node:</b>
    - A Swarm node is an instance of the Docker engine. 
    - It is possible to run multiple nodes on a single server. But in production deployments, nodes are distributed across various devices.
    - There are two types of nodes in Docker Swarm:
        - <b>Manager node: </b>Maintains cluster management tasks.
        - <b>Worker node: </b>Receives and executes tasks from the manager node.

## <b>Help Menu Of Docker Swarm</b>
<img src=../../Assets/03_Docker_Lab9-0.png>

