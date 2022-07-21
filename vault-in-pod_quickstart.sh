!/bin/bash

# Install vault with consul as backend in kuberbetes.

echo "********************** Vault-In-Pod Quickstart ******************"
echo "This qucikstart will install vault with consul backend in kubernetes"

read -n1 -p " Do you want to  continue [y/n]" answer

case $answer in
        (Y | y )
                echo "fine, let's start install";;
        (N | n)
                exit 0;;
esac

echo " **************** Install Vaule with helm ****************"

# create new namespace vault-in-pod

kubectl create namespace vault-in-pod


# set current ns as vault-in-pod

kubectl config set-context --current --namespace=vault-in-pod

# update Hashicporp's helm repo

helm repo add hashicorp https://helm.releases.hashicorp.com
helm repo update

slpee 2s


helm install vault hashicorp/vault --set "server.dev.enabled=true"

