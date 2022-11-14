# <b>Lab6_03: Starting Container with a Volume</b>

## <b>Using `-v`</b>
- As we saw with earlier example, we can start a container with a `bind mount` using `-v` option. 

    ```
    docker run -v $(pwd):/var/bind_mounts bash:latest \
    bash -c "echo Welcome to Docker Volume tutorial > /var/bind_mounts/ex1.txt && cat /var/bind_mounts/ex1.txt" 
    ```

- This syntax also supports mounting a volume.
    ```
    docker run -v manage_volume_demo:/var/bind_mounts bash:latest \
    bash -c "ls /var/bind_mounts"
    ```

- As our volume is empty, this lists nothing from the mount point. However, if we were to write to the volume during one invocation of the container:
    ```
    docker run -v manage_volume_demo:/var/bind_mounts bash:latest \
    bash -c "echo Welcome to Docker Volume tutorial > /var/bind_mounts/ex1.txt" 
    ```

    Then our subsequent use of container with this volume mounted would be to access the file:
    ```
    docker run -v manage_volume_demo:/var/new_container/bind_mounts bash -c "ls /var/new_container/bind_mounts"
    ```
    
- <b>Demo: </b>

    <img src=../../../Assets/03_Docker_Lab6_03-1.png>

- <b>Notes: </b>
    - The `-v` flag contains three components, separated by colons:
        - Source directory or volume name
        - Mount point within the container
        - (Optional) `ro` for read-only and `rw` for read/write.


## <b>Using the `--mount` option</b>
- We may prefer to use the more self-explanatory `--mount` option to specify the volume we wish to mount.
- Command:
   ```
   docker run --mount 'type=volume,src=manage_volume_demo,dst=/var/new_container/mount_point,volume-driver=local,readonly' bash -c "ls /var/new_container/mount_point"
    ```
- The inout to `--mount` is a string of key-value pairs, separated by commans. Here we've set:
    - <b>type</b>: as volume to indicate a volume mount
    - <b>src</b>: to name of the volume, though this could have been a source directory if we'd been making a bind mount.
    - <b>dst</b>: as the destination mount point in the container
    - <b>volume-driver</b>: the local driver in this case
    - <b>readonly</b>: to make this mount read-only, we could have chosemn `rw` for read/write.

- We should note that the above command will also create a volume if it does not already exist.

## <b>Using `--volumes-from` to share Volumes: </b>
- We should note that attaching a volume to a container creates a long-term connection between the container and the volume.
- Even when the container has exited, the relationship still exists.
- This allows us to use a container that has exited as a template for mounting the same set of volumes to a new one.
- <b>Example 1: </b>

    <img src=../../../Assets/03_Docker_Lab6_03-2.png>

- In above figure, `container id ed46` is used to create new container with the volume used by id `ed46`.
