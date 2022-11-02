# <b>Lab4: Dockerfile</b>
- `Dockerfile` is a text document that contains all the commands a user could call on the command line to assemble an image.
- Docker can build images automatically by reading the instructions from a `Dockerfile`.

## Dockerfile Instructions:
- <b>`FROM:`</b> 
    
    Usage:
    - `FROM <image>`
    - `FROM <image>:<tag>`
    - `FROM <image>@<digest>`

    Description:
    - `FROM` must be the first non-comment instruction in the Dockerfile.
    - `FROM` can appear multiple times within a single Dockerfile in order to create multiple images.
    - `FROM` is used to assign a base image.

- <b>`MAINTAINER:`</b>
    
    Usage:
    - `MAINTAINER <name>`

    Description:
    - `MAINTAINER` allows you to set the Author field of the generated images.

- <b>`RUN:`</b>

    Usage:
    - `RUN <command>`
    - `RUN ["<executable>","<param1>","param2"]`

    Description:
    - `RUN`: Run command on a shell while building an image. By default, `/bin/sh -c` is on Linux and `cmd /S /C` on `Windows`.
    - `RUN`: It also takes parameter required for a executeable file.

- <b>`CMD:`</b>
    
    Usage:
    - `CMD ["<executable>","<param1>","<param2>"]` (exec form, this is the preferred form)
    - `CMD ["<param1>","<param2>"]` (as default parameters to ENTRYPOINT)
    - `CMD <command> <param1> <param2>` (shell form)

    Description:
    - The main purpose of the `CMD` is to provide defaults for an executing container.
    - There can only be one `CMD` instruction in a `Dockerfile`. If there are more than one `CMD` then only the last one will take effect.
    - If the user specifies arguments to `docker run` then they will override the default specified in `CMD`.
    - If `CMD` is used to provide default arguments for the `ENTRYPOINT` instruction, both the `CMD` and `ENTRYPOINT` instructions should be specified with the JSON array format.

- <b>`LABEL:`</b>

    Usage:
    - `LABEL <key>=<value> [<key=<value>  ...]`

    Description:
    - The `LABEL` instruction adds metadata to an image.
    - To include spaces within a `LABEL` value, use quotes and backslashes as you would in command-line parsing.
    - If Docker encounters a label/key that already exists, the new value overrides any previous labels with identical keys.
    - To view an image’s labels, use the docker inspect command. They will be under the "Labels" JSON attribute.

- <b>`EXPOSE:`</b>

    Usage:
    - `EXPOSE <port> [<port> ...]`

    Description:
    - Informs Docker that the container listens on the specified network port(s) at runtime.
    - `EXPOSE` does not make the ports of the container accessible to the host.

- <b>`ENV:`</b>

    Usage:
    - `ENV <key> <value>`
    - `ENV <key>=<value> [<key>=<value> ...]` 

    Description:
    - The `ENV`instruction sets the environment variable <key> to the value <value>.
    - The value will be in the environment of all <b>descendant</b> Dockerfile commands and can be replaced inline as well.
    - The environment variables set using `ENV` will persist when a container is run from the resulting image.
    - The first form will set a single variable to a value with the entire string after the first space being treated as the <value> - including characters such as spaces and quotes.

- <b>`ADD:`</b>

    Usage:
    - `ADD` <src> [<src> ...] <dest>
    - `ADD` ["<src>", ... "<dest>"] (this form is required for paths containing whitespace)

    Description:
    - Copies new files, directories, or remote file URLs from <src> and adds them to the filesystem of the image at the path <dest>.
    - <src> may contain wildcards and matching will be done using Go’s filepath.Match rules.
    - If <src> is a file or directory, then they must be relative to the source directory that is being built.
    - <dest> is an absolute path, or a path relative to `WORKDIR`.
    - If <dest> doesn’t exist, it is created along with all missing directories in its path.


- <b>`COPY:`</b>

    Usage:
    - `COPY` <src> [<src> ...] <dest>
    - `COPY` ["<src>", ... "<dest>"] (this form is required for paths containing whitespace)

    Description:
    - Copies new files or directories from <src> and adds them to the filesystem of the image at the path <dest>.
    - <src> may contain wildcards and matching will be done using Go’s filepath.Match rules.
    - <src> must be relative to the source directory that is being built (the context of the build).
    - <dest> is an absolute path, or a path relative to `WORKDIR`.
    - If <dest> doesn’t exist, it is created along with all missing directories in its path.



- <b>`ENTRYPOINT:`</b>

    Usage:
    - `ENTRYPOINT ["<executable>", "<param1>", "<param2>"]`(exec form, preferred)
    - `ENTRYPOINT <command> <param1> <param2>` (shell form)

    Description:
    - Allows you to configure a container that will run as an executable.
    - Command line arguments to docker run `<image>` will be appended after all elements in an exec form `ENTRYPOINT` and will override all elements specified using `CMD`.
    - The shell form prevents any `CMD` or run command line arguments from being used, but the `ENTRYPOINT` will start via the shell. This means the executable will not be PID 1 nor will it receive UNIX signals. Prepend exec to get around this drawback.
    - Only the last `ENTRYPOINT` instruction in the Dockerfile will have an effect.

- <b>`VOLUME:`</b>

    Usage:
    - `VOLUME ["<path>", ...]`
    - `VOLUME <path> [<path> ...]`

    Description:
    - Creates a mount point with the specified name and marks it as holding externally mounted volumes from native host or other containers.

- <b>`USER:`</b>    

    Usage:
    - `USER <username | UID>`

    Description:
    - The `USER` instruction sets the user name or UID to use when running the image and for any `RUN`, `CMD` and `ENTRYPOINT` instructions that follow it in the Dockerfile.

- <b>`WORKDIR:`</b>

    Usage:
    - `WORKDIR </path/to/workdir>`

    Description:
    - Sets the working directory for any `RUN`, `CMD`, `ENTRYPOINT`, `COPY`, and `ADD` instructions that follow it.
    - It can be used multiple times in the one Dockerfile. If a relative path is provided, it will be relative to the path of the previous `WORKDIR` instruction.


- <b>`ARG:`</b>

    Usage:
    - `ARG <name>[=<default value>]`

    Description:
    - Defines a variable that users can pass at build-time to the builder with the docker build command using the `--build-arg <varname>=<value>` flag.
    - Multiple variables may be defined by specifying `ARG` multiple times.
    - It is not recommended to use build-time variables for passing secrets like github keys, user credentials, etc.
    - Build-time variable values are visible to any user of the image with the docker history command.
    - Environment variables defined using the `ENV` instruction always override an `ARG` instruction of the same name.
    - Docker has a set of predefined ARG variables that you can use without a corresponding `ARG` instruction in the Dockerfile.
        - `HTTP_PROXY` and `http_proxy`
        - `HTTPS_PROXY` and `https_proxy`
        - `FTP_PROXY` and `ftp_proxy`
        - `NO_PROXY` and `no_proxy`

- <b>`ONBUILD:`</b>

    Usage:
    - `ONBUILD <Dockerfile INSTRUCTION>`

    Description:
    - Adds to the image a trigger instruction to be executed at a later time, when the image is used as the base for another build.
    - The trigger will be executed in the context of the downstream build, as if it had been inserted immediately after the `FROM` instruction in the downstream Dockerfile.
    - Any build instruction can be registered as a trigger.
    - Triggers are inherited by the "child" build only. In other words, they are not inherited by "grand-children" builds.
    - The `ONBUILD` instruction may not trigger `FROM`, `MAINTAINER`, or `ONBUILD` instructions.

- <b>`STOPSIGNAL:`</b>

    Usage:
    - `STOPSIGNAL <signal>`

    Description:
    - The `STOPSIGNAL` instruction sets the system call signal that will be sent to the container to exit.
    - This signal can be a valid unsigned number that matches a position in the kernel’s syscall table, for instance 9, or a signal name in the format `SIGNAME`, for instance `SIGKILL`.

- <b>`HEALTHCHECK:`</b>

    Usage:
    - `HEALTHCHECK [<options>] CMD <command>` (check container health by running a command inside the container)
    - `HEALTHCHECK NONE` (disable any healthcheck inherited from the base image)

    Description:
    - Tells Docker how to test a container to check that it is still working.
    - Whenever a health check passes, it becomes <b>healthy</b>. After a certain number of consecutive failures, it becomes <b>unhealthy</b>.
    - The `<options>` that can appear are:
        - `--interval=<duration>` (default: 30s)
        - `--timeout=<duration>` (default: 30s)
        - `--retries=<number>` (default: 3)

- <b>`SHELL:`</b>

    Usage:
    - `SHELL ["<executable>", "<param1>", "<param2>"]`

    Description:
    - Allows the default shell used for the shell form of commands to be overridden.
    - Each `SHELL` instruction overrides all previous `SHELL` instructions, and affects all subsequent instructions.
    - Allows an alternate shell be used such as zsh, csh, tcsh, powershell, and others.