curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "step1"
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
echo "kubeadm install"
sudo apt update -y
sudo apt -y install vim git curl wget kubelet=1.26.0-00 kubeadm=1.26.0-00 kubectl=1.26.0-00
echo "memory swapoff"
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo swapoff -a
sudo modprobe overlay
sudo modprobe br_netfilter

sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF
sudo tee /etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
sudo sysctl --system

if (systemctl -q is-active containerd)
  then
    echo "containerd is  still running."
      sudo rm -rf /etc/containerd/config.toml
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
      sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
      sudo apt update
      sudo apt install -y containerd.io
      sudo mkdir -p /etc/containerd
      sudo cp /vagrant/Setup/crictl.yaml /etc
      sudo systemctl restart containerd
      sudo containerd config default |sudo tee /etc/containerd/config.toml
      sudo systemctl restart containerd
      sudo systemctl enable containerd  
  else
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install -y containerd.io
    sudo mkdir -p /etc/containerd
    sudo cp /vagrant/Setup/crictl.yaml /etc
    sudo systemctl restart containerd
    sudo containerd config default |sudo tee /etc/containerd/config.toml
    sudo systemctl restart containerd
    sudo systemctl enable containerd   
fi

sudo apt-mark hold kubectl kubeadm kubelet containerd.io
sudo systemctl enable kubelet
sudo systemctl disable ufw
sudo systemctl stop ufw
sudo sysctl --system