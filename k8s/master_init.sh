# 查看镜像列表
kubeadm config images list --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.25.2

# 获取镜像文件至本地
kubeadm config images pull --image-repository registry.aliyuncs.com/google_containers --kubernetes-version v1.25.2

kubeadm init --image-repository registry.aliyuncs.com/google_containers 
