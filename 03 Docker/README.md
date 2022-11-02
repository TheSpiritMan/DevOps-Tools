# <b>Docker Lab</b>

- <b>Docker</b> is a set of `Platform As A Service` (PaaS) products that use `OS-level` virtualization to deliver software in packages called `containers`.
- `Containers` are isolated from one another and bundle their own software, libraries and configuration files.
- The software that hosts the containers is called `Docker Engine`. 
- It was first started in 2013 and is developed by Docker, Inc.
- It can package an application and it's dependencies in a virtual container.
- The container can be run on any Linux, Windows or MacOS computer.
- This enables the application to run in a variety of locations such as on-premises, in public or private cloud. 

## <b>Components</b>
The Docker `Software as a Service (SAAS)` offers three components. They are:
 - <b>Software:</b> 
    - The Docker `Daemon` called `dockerd`. 
    - It manages docker containers and handlers container objects.
    - It also listens for requests sent via the `Docker Engine API`.
    - The Docker client program is called `docker` which provides a `Command Line Interface (CLI)`, that allows a user to interact with Docker `daemons`.

 - <b>Objects:</b>
    - The main classes of `Docker objects` are:
        - <b>images</b>
            - A Docker image is a read-only template used to build containers. Images are used to store and ship applications.
        - <b>containers</b>
            - A Docker container is a standardized, encapsulated environment that runs applications.
            - A container is managed using the Docker API or CLI.
        - <b>services</b>
            - A Docker service allows containers to be scaled across multiple Docker daemons.
            - The result is known as a swarm, a set of cooperating daemons that communicate through the Docker API.
    
 - <b>Registries</b>
    - A Docker registry is a repository for Docker images.
    - Docker clients connect to registries to download ("pull") images for use or upload ("push") images that they have built. Registries can be public or private.
    - The main public registry is `Docker Hub`.
    - Docker Hub is the default registry where Docker looks for images.


## <b>Tools</b>
- <b>Docker Compose</b>
    - `Docker Compose` is a tool for defining and running multi-container Docker applications.
    - It uses YAML files to configure the application's services and performs the creation and start-up process of all the containers with a single command.
    - The `docker-compose` CLI utility allows users to run commands on multiple conatiners at once.

- <b>Docker Swarm</b>
    - `Docker Swarm` provides native clustering functionality for Docker containers, which turns a group of Docker engines into a single virtual Docker engine.
    - The `docker swarm` CLI[37] utility allows users to run Swarm containers, create discovery tokens, list nodes in the cluster, and more.
    - The `docker node` CLI utility allows users to run various commands to manage nodes in a swarm, for example, listing the nodes in a swarm, updating nodes, and removing nodes from the swarm.
    - Docker manages swarms using the `Raft consensus` algorithm.

- <b>Docker Volume</b>
    - `Docker Volume` facilitates the independent persistence of data, allowing data to remain even after the container is deleted or re-created. 