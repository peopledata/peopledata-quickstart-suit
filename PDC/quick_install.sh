#!/bin/bash
# Author: jerry.zhang<jerry.zhang.bill@gmail.com>

echo "***************************** quick install ****************************"
echo "this quick install will install basic software:"
echo " 1. docker and docker-compose"
echo " 2. nodejs"
ech0 " 3. snap"
echo " 4. kubectl and helm"
echo " 5. minikube"
echo " 6. kubeadm (option)"

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
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo apt-get install docker-compose-plugin=2.3.3~ubuntu-focal


echo "Check if docker installed, you could run

$ sudo docker run hello-world

"

# let docker run without root privaledge

sudo usermod -aG docker $USER

# install docker-compse

sudo apt-get update
sudo apt-get install docker-compose-plugin
apt-cache madison docker-compose-plugin

sudo apt-get install docker-compose-plugin=


echo "*********************** install nodejs *********************"

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install nodejs
node --version

echo "nodejs installed!"

echo "********************** install kubectl ******************"

# install snapd
sudo apt update
sudo apt install snapd

# install kubectl using snap
snap install kubectl --classic

kubectl version --client

echo "kubectl installed"


echo "******************** install minikube ******************"



curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube


echo "minikube installed!" 
echo "reboot your machine, then start work!"

# install helm using snap

sudo snap install helm --classic

sudo apt install jq


read -n1 -p " Do you want to reboot now [y/n]" ans

case $ans in
        (Y | y )
                echo "fine, let's reboot"
		sudo reboot
        (N | n)
                exit 0;;
esac




#echo "******************** install kubeadm kubelet **************”
#sudo apt-get update
#sudo apt-get install -y apt-transport-https ca-certificates
#sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

#echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

#sudo apt-get update
#sudo apt-get install -y kubelet kubeadm 
#sudo apt-mark hold kubelet kubeadm


