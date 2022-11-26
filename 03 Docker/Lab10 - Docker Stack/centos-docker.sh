sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER
sudo systemctl disable firewalld
sudo systemctl stop firewalld
newgrp docker
sudo systemctl start docker