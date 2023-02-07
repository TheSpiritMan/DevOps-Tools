sudo kubeadm init --apiserver-advertise-address=192.168.57.20 --ignore-preflight-errors=all --pod-network-cidr=12.12.0.0/16 --v=5
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf ~/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "sudo $(sudo kubeadm token create --print-join-command) --ignore-preflight-errors=all --v=5" > /vagrant/Setup/script/join-cluster.sh