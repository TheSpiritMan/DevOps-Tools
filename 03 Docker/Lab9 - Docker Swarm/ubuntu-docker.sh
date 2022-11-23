sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER
sudo systemctl restart docker
sudo systemctl disable ufw
sudo systemctl stop ufw
newgrp docker