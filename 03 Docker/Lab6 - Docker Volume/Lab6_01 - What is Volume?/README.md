# <b>Lab6_01: What is Volume?</b>

## <b>The Docker File System</b>
- A docker container runs the software stack defined in an `image`.
- Images are made of a set of read-only layers that work on a file system called the `Union File System`.
- When we start a new container, `Docker` adds a read-write layer on the top of the image layers allowing the container to run as though on a standard Linux file system.

<h3><b>Note: </b></h3> 
<b>When the container is stopped or deleted, that read-write layer is lost</b>.

<img src=../../../Assets/03_Docker_Lab6_01-1.png>

<b>Example 1:</b>
- We can try this out by running a command that writes and then reads a file:
    ```
    docker run bash:latest \
    bash -c "echo Welcome to Docker Volume tutorial > welcome.txt && cat welcome.txt"
    ```
- Output:

    <img src=../../../Assets/03_Docker_Lab6_01-2.png>

<b>Example 2:</b> 
- But if we run the same image with just the command to output the file's contents. We will get error.
    ```
    docker run bash:latest  bash -c "cat welcome.txt"
    ```
- Output:

    <img src=../../../Assets/03_Docker_Lab6_01-3.png>


## <b>Bind Mounts</b>
- Docker <b>bind mount</b> is a high performance connection from the container to a directory on the host machine.
- <b>It allows the host to share its own file system with the container</b>, which can be made read-only()ro or read-write(rw).

<b> Example 1:</b>
- If we wanted to use a custom version of `bash` for a particular script, we might execute that script in a bash container, mounted to our current working directory.
- Command:
    ```
    docker run -v $(pwd):/var/bind_mounts bash:latest \
    bash -c "echo Welcome to Docker Volume tutorial > /var/bind_mounts/ex1.txt && cat /var/bind_mounts/ex1.txt"
    ```
- Output:

    <img src=../../../Assets/03_Docker_Lab6_01-4.png>

- `-v` flag is for volume.
- `$(pwd)` is the current working directory which is provided as a src path for the container.
- `/var/bind_mounts` is the destination path which is created inside the container.
- As shown in above figure, we can see that the `ex1.txt` file is created both on host and container system.


## Docker Volumes
- A bind mount uses the host file system, but `Docker Volumes` are native to Docker. The data is kept somewhere on storage attached to the host - often the local file system.
- The volume itself has a lifecycle that's longer than the container's allowing itto persist until no longer needed.
- Volumes can be shared between containers.
- In some cases, the volume is in a form that is not usable by the host directly.