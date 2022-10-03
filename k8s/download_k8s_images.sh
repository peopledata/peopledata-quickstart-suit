#批量下载k8s cluster需要的镜像
kubeadm config images list |sed -e 's/^/docker pull /g' -e 's#k8s.gcr.io#docker.io/mirrorgooglecontainers#g' |sh -x
#批量命名镜像
docker images |grep mirrorgooglecontainers |awk '{print "docker tag ",$1":"$2,$1":"$2}' |sed -e 's# mirrorgooglecontainers# k8s.gcr.io#2' |sh -x
#批量删除mirrorgooglecontainers镜像
docker images |grep mirrorgooglecontainers |awk '{print "docker rmi ", $1":"$2}' |sh -x
# coredns没包含在docker.io/mirrorgooglecontainers中
# coredns版本号根据 kubeadm config images list输出的结果更新
docker pull coredns/coredns:[x.x.x]
docker tag coredns/coredns:[x.x.x] k8s.gcr.io/coredns:[x.x.x]
docker rmi coredns/coredns:[x.x.x]
