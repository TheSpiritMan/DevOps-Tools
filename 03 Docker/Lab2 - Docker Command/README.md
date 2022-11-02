# <b>Lab2: Docker Command</b>
In previous lab, we can see the `command` available in `docker`.
So in this lab, we will understand the command which are frequently used in docker.

## Docker Command Usage
- `docker help`: To display help menu of `docker`
- `docker images`: List all the images available in computer
- `docker pull $Image_Name`: Pull image from `Docker Hub` where `$Image_Name` is name of the image which is to be pulled.

    Eg: `docker pull ubuntu:latest`: Pull the latest iamge of ubuntu.

- `docker run ubuntu`: Run `ubuntu` as a container and close immediately.
- `docker ps`: List all the running container
- `docker ps -a`: List all the container
- `docker container prune`: Remove all the stopped container.
- `docker run -t -d --name=ubuntubox ubuntu`: Here:
    - `-d` flag is for `detach` mode which means run container in background and print container ID.
    - `-t` is to allocate a `pseudo-TTY`
    - `--name` is to assign name for a container where `ubuntubox` is a container name.
- `docker stop ubuntubox`: Stop the container
- `docker start ubuntubox`: Start the container
- `docker exec ubuntubox id`: 
    - `exec` is to execute a command inside a container
    - `ubuntubox` is a container 
    - `id` is a command to be executed.
- `docker exec ubuntubox apt-get update`: `apt-get update` will retrieve new lists of packages.
- `docker exec -it ubuntubox bash`: `bash` will give a interactive shell to perform all the required task.
- `docker rename ubuntubox new_box`: `rename` will rename a container name.
- `docker rm ubuntubox`: `rm` will remove the stopped container.
- `docker rmi hello-world`: `rmi` will remove the images from computer.
- `docker build -t $ImageName:$Tag -f Dockerfile .`: 
    - `build`: Builds a image from a Dockerfile.
    - `-t`: Name and optionally a tag in the 'name:tag' format
    - `-f`: Name of the Dockerfile
    - `.`: Path for a Dockerfile
- `docker image tag $OldName:$Tag $NewName:$Tag`
    - `$OldName:$Tag`: Old Image Name and Tag 
    - `$NewName:$Tag`: New Image Name and Tag
- `docker login`: Login to Docker Hub with <b>Username</b> and <b>Password</b>.
- `docker push $ImageName:$Tag`: `push` will push the image into the `Docker Hub` account.
    
    <b>Note:</b> The image name should be followed by the username of the DockerHUb account. Eg:
        For my case, the image should be <b>thespiritman/image_name:latest</b>.