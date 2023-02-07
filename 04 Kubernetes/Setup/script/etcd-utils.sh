# env
ETCD_VER=v3.5.0
GITHUB_URL=https://github.com/etcd-io/etcd/releases/download

# remove if you ran this twice
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

# download tar file
curl -L ${GITHUB_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
mkdir -p /tmp/etcd-download

# extract files
tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd-download --strip-components=1

#remove tar file
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

# check version
/tmp/etcd-download/etcd --version
/tmp/etcd-download/etcdctl version
/tmp/etcd-download/etcdutl version

# move bin files
sudo mv /tmp/etcd-download/etcd* /usr/local/bin

# remove folder
rm -rf /tmp/etcd-download