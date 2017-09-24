set -x 
export K8S_VERSION=1.7.6
nohup dockerd -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock 2>1 &
wget https://github.com/kubernetes/kubernetes/archive/v${K8S_VERSION}.tar.gz
tar -vxf v${K8S_VERSION}.tar.gz
cd v${K8S_VERSION}
build/run.sh make cross

