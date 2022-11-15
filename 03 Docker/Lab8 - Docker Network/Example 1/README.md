# <b>Docker Network Example</b>
- The `docker-compose` file contains below code:
    ```
    version: "3.5"

    services:
    test1:
        image: node
        command: node -e "const http = require('http'); http.createServer((req, res) => { res.write('Hello from test1\n'); res.end() }).listen(8080)"
        ports:
        - "8080:8080"
        networks:
        - network1
    test2:
        image: node
        command: node -e "const http = require('http'); http.createServer((req, res) => { res.write('Hello from test2\n'); res.end() }).listen(8080)"
        ports:
        - "8081:8080"
        networks:
        - network1
        - network2
    test3:
        image: node
        command: node -e "const http = require('http'); http.createServer((req, res) => { res.write('Hello from test3\n'); res.end() }).listen(8080)"
        ports:
        - "8082:8080"
        networks:
        - network2

    networks:
    network1:
        name: network1
    network2:
        name: network2
    ```

- Here is a diagram of these containers for a more visual representation:

    <img src=../../../Assets/03_Docker_Lab8_E-1.png>

- Start Services using `docker compose`.

- <b>Output: </b>
    
    <img src=../../../Assets/03_Docker_Lab8_E-2.png>


## <b>List Networks:</b>

<img src=../../../Assets/03_Docker_Lab8_E-3.png>

  
- We can see that there are our 2 new networks. They are: 
    - <b>network1</b>
    - <b>network2</b>

## <b>Inspect the network:</b>
    docker inspect network1 network2
   <img src=../../../Assets/03_Docker_Lab8_E-4.png>
   <img src=../../../Assets/03_Docker_Lab8_E-5.png>

- Above command produces a lengthy output which we rarely need. 
- We can format it using `Go templates` and extract only the elements that suit our needs.
- Let's get only the subnet of `network1`.
    <b>Command:</b>
    ```
    docker inspect -f '{{range .IPAM.Config}}{{.Subnet}}{{end}}' network1
    ```

    <b>Output:</b>

    <img src=../../../Assets/03_Docker_Lab8_E-6.png>


## <b>Inspecting the Container: </b>
- First, let's listall the containers with their identifiers:
    Command:
    ```
    docker ps --format 'table {{.ID}}\t{{.Names}}'
    ```

    <b>Output: </b>

    <img src=../../../Assets/03_Docker_Lab8_E-7.png>

- Now we'll use the <b>Container's ID</b> as an argument to the `inspect` command to find it's <b>IP Address</b>.

    <img src=../../../Assets/03_Docker_Lab8_E-8.png>

- Also, we can print hosts directly froma container using `docker exec` command:

    <img src=../../../Assets/03_Docker_Lab8_E-9.png>


## <b>Communication Between Containers: </b>
- Using knowledge about our Docker networks, we can establish communication between containers in the same network.
- First, let's get inside the  <b>`test1`</b> container and curl <b>test2</b>.
   
    <img src=../../../Assets/03_Docker_Lab8_E-10.png>

- We successfully curl `test2` from `test1` because both the containers are on same network i.e `network1`.

- Second, let's get inside the `test2` container and curl on both <b>`test1`</b> and <b>`test3`</b>.

    <img src=../../../Assets/03_Docker_Lab8_E-11.png>

- Third, get inside <b>`test3`</b> container and curl on both <b>`test1`</b> and <b>`test2`</b>. The curl on <b>`test2`</b> will be success but on <b>`test1`</b> will fail because <b>`test1`</b> and <b>`test3`</b> are in different container.

- To make this work, we need to add <b>`test1`</b> container to <b>`network2`</b> (from outside the container).
- Command:
    ```
    docker network connect --alias test1 network2 3ab751043a80
    ```
- <b>Demo: </b>

    <img src=../../../Assets/03_Docker_Lab8_E-12.png>

- Since, <b>`test1`</b> is added to <b>`test3`</b> network. <b>`test1`</b> must also be able to curl <b>`test3`</b>.
- <b>Test: </b>

    <img src=../../../Assets/03_Docker_Lab8_E-13.png>
