设置etcd的API 版本
export ETCDCTL_API=3  or export ETCDCTL_API=2

etcd --advertise-client-urls=https://192.168.80.150:2379 --cert-file=/etc/kubernetes/pki/etcd/server.crt 
--client-cert-auth=true --data-dir=/var/lib/etcd --initial-advertise-peer-urls=https://192.168.80.150:2380 
--initial-cluster=k8s-master01=https://192.168.80.150:2380 --key-file=/etc/kubernetes/pki/etcd/server.key 
--listen-client-urls=https://127.0.0.1:2379,https://192.168.80.150:2379 --listen-peer-urls=https://192.168.80.150:2380 
--name=k8s-master01 --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt --peer-client-cert-auth=true 
--peer-key-file=/etc/kubernetes/pki/etcd/peer.key --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt 
--snapshot-count=10000 --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt

etcdctl --endpoints https://192.168.80.150:2379  --cert-file=/etc/kubernetes/pki/etcd/server.crt --key-file=/etc/kubernetes/pki/etcd/server.key --ca-file=/etc/kubernetes/pki/etcd/ca.crt get --prefix / --keys-only


etcdctl --endpoints https://192.168.80.150:2379  --cert-file=/etc/kubernetes/pki/etcd/server.crt --key-file=/etc/kubernetes/pki/etcd/server.key --ca-file=/etc/kubernetes/pki/etcd/ca.crt get --prefix / --keys-only

etcdctl --endpoints https://192.168.80.150:2379  --cert /etc/kubernetes/pki/etcd/server.crt --key /etc/kubernetes/pki/etcd/server.key --cacert /etc/kubernetes/pki/etcd/ca.crt get --prefix / --keys-only