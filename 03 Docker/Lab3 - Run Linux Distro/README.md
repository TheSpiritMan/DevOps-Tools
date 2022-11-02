# <b>Lab3: Run Linux Distrobution</b>

In this lab, we will run different linux distro as a docker container.

<b>Note:</b> 

To run any `container`, we must have it's `image` in our computer. If it is not available inside our computer then it will fetch the image from the public registry i.e `Docker Hub` unless we specify a private registry.

## <b>Ubuntu Linux</b>
- To run ubuntu as a container, we must have a ubuntu image.
- Command to download ubuntu image:
    ```
    docker pull ubuntu:latest
    ```
- Run the image as a container:
    ```
    docker run -d -t --name=u1 ubuntu:latest
    ```
- Access shell of the container:
    ```
    docker exec -it u1 bash
    ```
- Update the cache:
    ```
    apt-get update
    ```
- Install Curl and Apache2 server
    ```
    apt-get install curl apache2 -y
    ```
- Start Apache2 service
    ```
    service apache2 start
    ```
- Curl default homepage of Apache2
    ```
    curl http://localhost
    ```

## <b>Kali Linux</b>
- To run Kali as a container, we must have a Kali image.
- Command to download Kali image:
    ```
    docker pull kalilinux/kali-rolling
    ```
- Run the image as a container:
    ```
    docker run -d -t --name=k1 kalilinux/kali-rolling:latest
    ```
- Access shell of the container:
    ```
    docker exec -it k1 bash
    ```
- Update the cache:
    ```
    apt update
    ```
- Install MariaDb server
    ```
    apt install mariadb-server -y
    ```
- Start Apache2 service
    ```
    service mariadb start
    ```
- Login To Mariadb Server
    ```
    mariadb -u root -p
    ```
- Check Databases:
    ```
    show databases;
    ```