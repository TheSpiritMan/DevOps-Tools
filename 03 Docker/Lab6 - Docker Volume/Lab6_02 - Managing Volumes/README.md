# <b>Lab6_02: Managing Volumes</b>
- Docker allows us to manage volumes via the `docker volume` set of commands.
- We can give a volume an explicit name (named volumes).
- Also if no name providedm Docker generate a random name for volumes.


## <b>Creating Volumes</b>
- We can create volume simply using a `create` subcommand.
- If we provide an argument to that command, the volume named with that argument will be created.
- If we do not provide an argument, docker will generate a random name for volume.
- <b>Demo:</b>

    <img src=../../../Assets/03_Docker_Lab6_02-1.png>


## <b>Listing Volumes</b>
- We can list volume simply using `ls` subcommand.

- We can list volume by appending `-f` flag for `key=value` on `ls` subcommand.

    <img src=../../../Assets/03_Docker_Lab6_02-2.png>

## <b>Inspecting Volumes</b>
- We can inspect all the details about the volume.
- We can inspect a single volume at a time or multiple volumes at a time.
- The subcommand `inspect` is used.
- <b>Demo: </b>

    <img src=../../../Assets/03_Docker_Lab6_02-3.png>

- <b>Note: </b> The `Driver` of the volume describes how the Docker host locates the volume. Volumes can be on remote storage via nfs. The volume is in local storage for above example.

## <b>Removing Volumes</b>
- To remove one or more volumes individually, we can use `rm` subcommand.
- <b>Demo: </b>

    <img src=../../../Assets/03_Docker_Lab6_02-4.png>


## <b>Pruning Volumes</b>
- To delete all the unused volume at a single time.
- <b>Demo: </b>

    <img src=../../../Assets/03_Docker_Lab6_02-5.png>

- In above case, since we have already deleted `manage_volume_demo` using `rm` subcommand. So we were left with only one volume.