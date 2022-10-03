# 查看镜像列表
kubeadm config images list --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.25.2

# 获取镜像文件至本地
kubeadm config images pull --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.25.2

kubeadm init \
--image-repository registry.aliyuncs.com/google_containers \
--control-plane-endpoint apiserver.host.com \
--kubernetes-version v1.18.1 \
--apiserver-advertise-address 10.7.79.148 \
--service-cidr 192.168.0.0/16 \
--pod-network-cidr 172.16.0.0/16 \
--token-ttl 0 \
--upload-certs
