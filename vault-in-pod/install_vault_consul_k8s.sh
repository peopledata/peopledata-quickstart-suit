#!/bin/bash

# Install Vault and Consule in Kubernetes.
echo "********************* Install Vault and Consul in Kubernetes *********************"



echo "Check minikube status"
read -n1 -p " Does minikube runing [y/n]" answer

case $answer in 
	(Y | y )
		echo "fine, let's move on";;
	(N | n)
        echo "please run minikube first";;
		exit;;
esac



read -n1 -p " Does vault-in-pod directory exit [y/n]" answer

case $answer in 
	(Y | y )
		echo "fine, let's start install";;
	(N | n)
        echo "mkdir vault-in-pod";;
        mkdir vault-in-pod && cd vault-in-pod;;
esac




