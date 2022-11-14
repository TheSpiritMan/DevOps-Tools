# <b>Lab01: Docker Compose File</b>
- Docker Compose file is written in <b>YAML(YAML A'int MarkUp Language)</b> File.
- To write Docker Compse file, you must have knowledge of YAML file.
- By default, Docker Compose reads `docker-compose.yml` as a main file. We can also specify any other file as a docker-compose file till the format is correct.


## File Format
- Docker-compose file must always start with the version of the working docker-compose.
    ```
    version: "3"
    ```
- Docker-compose is made to manage multiple services. So all the services must be included inside the `services` key.
    ```
    services:
     1_service:
      ...
     2_service:
      ...
    ```
- The individual services name can be anything according to developer's choice. Like: `myscustom_service`, `1_service` or even as `frontend`, `backend` and `db`.
- Every details needed for single service must be included inside it.
    ```
    1_service:
      build: /path/to/dockerfile/
      image: 1_image
      container_name: 1_image_box
      ports:
        - "80":"8080"
    
    2_service:
      image: ubuntu:latest
      container_name: ubuntu
    ```

- Combining all the above syntax, `docker-compose.yml` seems as below:
    ```
    version: "3"
    services:
      1_service:
        build: /path/to/dockerfile/
        image: 1_image
        container_name: 1_image_box
        ports:
          - "80":"8080"

      2_service:
        image: ubuntu:latest
        container_name: ubuntu
    ```

## <b>Examples</b>
There are 3 examples where different case study are shown.

- <b>`Example 1:`</b>
    ```
    version: "3"
    services:
      first-service:
        image: ubuntu:latest
        container_name: ubuntu
        tty: true

      second-service:
        image: kalilinux/kali-rolling 
        container_name: kali
        tty: true
    ```
  - In example1, we can see as there are 2 services being managed.
  - The image used by the services are pre-built image. So they are directly downloaded from public registry i.e <b>`Docker Hub`</b>.
  - The container name of the image are also included.
  - By default, only one instance of the container are run. Although we can scale it upto any numbers.
  - Command:
    - To build and start the container:
        ```
        docker-compose up -d
        ```
        - `-d` flag is to run containers in detached mode.

    - To list the running instances of the services:
        ```
        docker-compose ps
        ```

    - To stop and delete the container:
        ```
        docker-compose down
        ```


- <b>`Example 2:`</b>
    ```
    version: "3"
    services:
      custom_app_1:
        build: https://github.com/TheSpiritMan/Simplilearn-DevOps-Project1-Angular.git#main
        image: simplilearn-p1-image
        ports:
        - "8080:80"
        container_name: simplilearn
        tty: true

      custom_app_2:
        build: https://github.com/TheSpiritMan/TelephoneDelayCallSystem.git#main
        image: telephonedelaycallsystem
        container_name: telephone
        tty: true
    ```

    - In Example2, we can see that 2 custom services are being managed.
    - Both the services' images are not fetched from registry rather they are built using a Dockerfile which is available in Github Repository with it's branch name.
    - We can also point to path of Dockerfile in local system.
    - The keyword `build` is to build the image.
    - The keyword `iamge` is to assign a name to a building image.
    - In `custom_app_1`, we can see that the `Port 80` from container is forwarded to `Port 8080` in host machine.
    - We can also see that `tty` is enabled in both the container.
    - Command:
        - We can build images and start container with `docker-compose up -d` command.
        - But when we run our `custom_app_2` service's container in detached mode, we can not see the output of the java application.
        - So what we can do is, build images and start `custom_app_1` service's container in detached mode and `custom_app_2` service's container in interactive mode.

        - To do so:
            - Build the images of the services:
                ```
                docker-compose build
                ```
            - Once build process is complete, we can also see those images in `docker images` list.
            - Start individual services. Syntax: `docker-compose up -d <service_name>`.

                Eg:

                For `custom_app_1`,
                ```
                docker-compose up -d custom_app_1
                ```

                <b>Output:</b>

                <img src=../../../Assets/03_Docker_Lab7_02-1.png>

                <b>Verify:</b>
                - We have forwarded `Port 80` from container to `Port 8080` in our local machine.
                - Visit `http://localhost:8080` in browser.
                    <img src=../../../Assets/03_Docker_Lab7_02-2.png>

                - Or do `curl http://localhost:8080` in terminal.
                    <img src=../../../Assets/03_Docker_Lab7_02-3.png>

                For `custom_app_2`,
                ```
                docker_compose up custom_app_2
                ```

                <b>Output:</b>
                <img src=../../../Assets/03_Docker_Lab7_02-4.png>


        - Since everything is working fine, we can stop and remove the container. Command:
            ```
            docker-compose down
            ```  

- <b>`Example 3:`</b>
  ```
  version: "3"
  services:
    mysql_docker:
      image: mysql
      container_name: mysql_docker
      ports:
        - "3306:3306"
      environment:
        MYSQL_ROOT_PASSWORD: root
        MYSQL_PASSWORD: root
        MYSQL_DATABASE: FirstCRUDApp
      volumes:
        - ./init_data:/docker-entrypoint-initdb.d
      restart: always
      tty: true

    custom_app:
      # build: https://github.com/TheSpiritMan/FirstCRUDApplication.git#main
      # build: .
      image: thespiritman/firstcrudapplication
      container_name: firstcrudapp
      ports:
        - "5555:5555"
      depends_on:
        - mysql_docker
      tty: true
      restart: always

  volumes:
    init_data: 
  ```

- In `Example 3`, we can see that there are 2 micro-services. They are: `mysql_docker` and  `custome_app`.
- This `docker-compose` file is from one of my many project. [Visit this link](https://github.com/TheSpiritMan/FirstCRUDApplication) to know more about this project.
- `Custom_app` depends on `mysql_docker`. So `custom_app` will start once `mysql_docker` is fully ready to perform our task.
- The tag `restart: always` will restart the container on failure.
- `Volume` is specified to dump sql file into the container on startup.
- Command:
  ```
  docker-compose up -d
  ```
- Since all the image are pulled from the public registry, strarting the container should not take long time.
- But to set custom <b>user</b> and <b>password</b> inside `mysql_docker` and to dump the sql file is the Database will take some times. So the application will only be available after completing those task.

- Once all tasks are done, visit the link [http://localhost:5555](http://localhost:5555).

  <img src=../../../Assets/03_Docker_Lab7_02-5.png>

- Click on <b>Manage User</b>

  <img src=../../../Assets/03_Docker_Lab7_02-6.png>
- Then you can add and delete a user.
- All these data are fetched from `mysql_docker` service.
- Command to stop and delete all the services:
  ```
  docker-compose down
  ```




<h1><b>End of Lab for Docker Compose.</b></h1>