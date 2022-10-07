#!/bin/bash
# jerry.zhang

echo "***************************** quick install ****************************"
echo "this quick install will install basic software:"
echo " 1. docker"
echo " 2. nodejs"

echo "************************************************************************"

read -n1 -p " Do you want to  continue [y/n]" answer

case $answer in 
	(Y | y )
		echo "fine, let's start install";;
	(N | n)
		exit 0;;
esac


echo "********************** install docker *********************"

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo apt-get install -y docker-compose-plugin=2.3.3~ubuntu-focal


echo "Check if docker installed, you could run


# let docker run without root privaledge

sudo usermod -aG docker $USER


echo "*********************** install nodejs *********************"

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install nodejs
node --version

echo "nodejs installed!"


# install helm using snap
sudo apt install snapd

sudo snap install helm --classic

sudo apt install jq




#echo "******************** install kubeadm kubelet **************”
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates



#echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | sudo apt-key add -

sudo add-apt-repository "deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main"

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

sudo swapoff -a
