# <b>Docker Swarm Project Demo</b>
Here we will do complex docker swarm project which requires multiple services.

# <b>Example Voting App</b>
- This project is taken from <b>Docker Sample</b> Github. If you want to know more about this project. Click in the [Link](https://github.com/dockersamples/example-voting-app) to open Github Page.
- Although the github page includes docker-compose file, we will not used it. We will create everything from the <b>CLI(Command Line Interface)</b>.


### <b>Architecture</b>
<img src=../../../Assets/03_Docker_Lab9-architecture.png width="600" height="500">

- From above figure, we can see that there are 5 services required for this project.
- All the image required for this project can be easily found in Docker Hub in <b>[Docker Sample](https://hub.docker.com/u/dockersamples)</b> Repository.
- The image links used in this project can be found below:
    - [Result App](https://hub.docker.com/r/dockersamples/examplevotingapp_result): `docker pull dockersamples/examplevotingapp_result:before`
    - [Vote App](https://hub.docker.com/r/dockersamples/examplevotingapp_vote): `docker pull dockersamples/examplevotingapp_vote:before`
    - [Worker App](https://hub.docker.com/r/dockersamples/examplevotingapp_worker): `docker pull dockersamples/examplevotingapp_worker:dotnet-alpine`
    - [Redis](https://hub.docker.com/_/redis): `docker pull redis:alpine`
    - [PostgreSQL](https://hub.docker.com/_/postgres): `docker pull postgres:9.4`


### <b>Docker Swarm</b>
- `Docker Swarm` is already created from [01_Docker Swarm Cluster]().
- There are total 4 nodes. They are:
    - <b>Master1: </b>Manager Node
    - <b>Worker1: </b>Worker Node
    - <b>Worker2: </b>Worker Node
    - <b>Worker3: </b>Worker Node

### <b>Docker Network</b>
- If you want to revise <b>Docker Network</b>, visit this [link](https://github.com/TheSpiritMan/DevOps-Tools/tree/main/03%20Docker/Lab8%20-%20Docker%20Network).
- There are 2 network. They are:
    - <b>frontend_ntw</b>
    - <b>backend_ntw</b>

### <b>Docker Volume</b>
- If you want to revise <b>Docker Volume</b>, visit this [link](hhttps://github.com/TheSpiritMan/DevOps-Tools/tree/main/03%20Docker/Lab6%20-%20Docker%20Volume).
- There is 1 volume. That is:
    - <b>db-data</b>


## <b>Hands On Lab</b>
- Bring up the <b>Virtual machine</b> from <b>vagrant</b> command.
- All the tasks are created in `master1` node.
- Nodes of the <b>Docker Swarm Cluster</b> are:

    <img src=../../../Assets/03_Docker_Lab9-7.png>

- <b>Create Docker Networks:</b>

    <img src=../../../Assets/03_Docker_Lab9-26.png>

- <b>Create Docker Volume:</b>

    <img src=../../../Assets/03_Docker_Lab9-27.png>

- <b>Create Services:</b>
    - <b>PostgreSQL Service:</b>

        <img src=../../../Assets/03_Docker_Lab9-28.png>

    - <b>Redis Service:</b>

        <img src=../../../Assets/03_Docker_Lab9-29.png>

    - <b>Worker Service:</b>

        <img src=../../../Assets/03_Docker_Lab9-30.png>

    - <b>Voting App Service</b>

        <img src=../../../Assets/03_Docker_Lab9-31.png>

    - <b>Result App Service</b>

        <img src=../../../Assets/03_Docker_Lab9-32.png>

- <b>List Services:</b>

    <img src=../../../Assets/03_Docker_Lab9-33.png>

### <b>Open App in Browser</b>
- <b>Voting App</b>
    - Since we have 4 containers of voting app, all the containers are distributed in allthe nodes fo the cluster. So the voting app can be found in <b>Port 5000</b>.
    - To test, visit [192.168.57.6:5000](http://192.168.57.6:5000), following page will open: 
        <img src=../../../Assets/03_Docker_Lab9-34.png>

- <b>Result App</b>
    - Since we have only one container of resulting app and that container is created in `worker1` node. So visit any IP with `Port 5001`, following page will open: 
        <img src=../../../Assets/03_Docker_Lab9-35.png>

### <b>Conclusion</b>
- Docker Swarm  Demo project is completed.
- If you want, you can delete all the services, volume and networks yourself.