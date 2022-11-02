# <b>Lab1: Docker & Docker Compose Installation</b>

In this lab, we will simply install <b>docker</b> and <b>docker-compose</b> in out linux machine. 

  - Enter `sudo apt install -y docker.io docker-compose` to install `docker` and `docker-compose` in your `ubuntu` distro.
  - Then enter `sudo usermod -aG docker $USER` to add your current user in docker group.
  - Then enter `newgrp docker` to relist the user in `docker` group.
  - `Docker` and `docker-compose` is now available in your system.

## Validate Docker
  - To validate docker is available in our system. Enter: `docker run hello-world`. If it run successfully and display output similar to below then docker is working fine in your system.


    Output:
    ```
    Unable to find image 'hello-world:latest' locally
    latest: Pulling from library/hello-world
    2db29710123e: Pull complete 
    Digest: sha256:e18f0a777aefabe047a671ab3ec3eed05414477c951ab1a6f352a06974245fe7
    Status: Downloaded newer image for hello-world:latest

    Hello from Docker!
    This message shows that your installation appears to be working correctly.

    To generate this message, Docker took the following steps:
    1. The Docker client contacted the Docker daemon.
    2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
        (amd64)
    3. The Docker daemon created a new container from that image which runs the
        executable that produces the output you are currently reading.
    4. The Docker daemon streamed that output to the Docker client, which sent it
        to your terminal.

    To try something more ambitious, you can run an Ubuntu container with:
    $ docker run -it ubuntu bash

    Share images, automate workflows, and more with a free Docker ID:
    https://hub.docker.com/

    For more examples and ideas, visit:
    https://docs.docker.com/get-started/
    ```

## Help Manual of Docker
  - Below is a help list for docker:
    ```
    Usage:  docker [OPTIONS] COMMAND

    A self-sufficient runtime for containers

    Options:
          --config string      Location of client config files (default "/home/ubuntu/.docker")
      -c, --context string     Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default
                              context set with "docker context use")
      -D, --debug              Enable debug mode
      -H, --host list          Daemon socket(s) to connect to
      -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
          --tls                Use TLS; implied by --tlsverify
          --tlscacert string   Trust certs signed only by this CA (default "/home/ubuntu/.docker/ca.pem")
          --tlscert string     Path to TLS certificate file (default "/home/ubuntu/.docker/cert.pem")
          --tlskey string      Path to TLS key file (default "/home/ubuntu/.docker/key.pem")
          --tlsverify          Use TLS and verify the remote
      -v, --version            Print version information and quit

    Management Commands:
      builder     Manage builds
      config      Manage Docker configs
      container   Manage containers
      context     Manage contexts
      image       Manage images
      manifest    Manage Docker image manifests and manifest lists
      network     Manage networks
      node        Manage Swarm nodes
      plugin      Manage plugins
      secret      Manage Docker secrets
      service     Manage services
      stack       Manage Docker stacks
      swarm       Manage Swarm
      system      Manage Docker
      trust       Manage trust on Docker images
      volume      Manage volumes

    Commands:
      attach      Attach local standard input, output, and error streams to a running container
      build       Build an image from a Dockerfile
      commit      Create a new image from a container's changes
      cp          Copy files/folders between a container and the local filesystem
      create      Create a new container
      diff        Inspect changes to files or directories on a container's filesystem
      events      Get real time events from the server
      exec        Run a command in a running container
      export      Export a container's filesystem as a tar archive
      history     Show the history of an image
      images      List images
      import      Import the contents from a tarball to create a filesystem image
      info        Display system-wide information
      inspect     Return low-level information on Docker objects
      kill        Kill one or more running containers
      load        Load an image from a tar archive or STDIN
      login       Log in to a Docker registry
      logout      Log out from a Docker registry
      logs        Fetch the logs of a container
      pause       Pause all processes within one or more containers
      port        List port mappings or a specific mapping for the container
      ps          List containers
      pull        Pull an image or a repository from a registry
      push        Push an image or a repository to a registry
      rename      Rename a container
      restart     Restart one or more containers
      rm          Remove one or more containers
      rmi         Remove one or more images
      run         Run a command in a new container
      save        Save one or more images to a tar archive (streamed to STDOUT by default)
      search      Search the Docker Hub for images
      start       Start one or more stopped containers
      stats       Display a live stream of container(s) resource usage statistics
      stop        Stop one or more running containers
      tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
      top         Display the running processes of a container
      unpause     Unpause all processes within one or more containers
      update      Update configuration of one or more containers
      version     Show the Docker version information
      wait        Block until one or more containers stop, then print their exit codes

    Run 'docker COMMAND --help' for more information on a command.

    To get more help with docker, check out our guides at https://docs.docker.com/go/guides/
    ```