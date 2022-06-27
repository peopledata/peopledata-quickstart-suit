#!/bin/bash
# jerry.zhang

echo "***************************** Config Personal Data Center ****************************"
echo "This config will install and initial config following tools and components"
echo " 1. vault/KMS: your personal KMS and wallet"
echo " 2. verixyz: DID and verifiable data"
echo " 3. datomspace: your personal data spaces"
echo " 4. personal-blockchain: your personal blockchian"
echo " We use kubectl deploy above tools and components."
echo "***************************************************************************************"

read -n1 -p " Do you want to  continue [y/n]" answer

case $answer in 
	(Y | y )
		echo "fine, let's start install";;
	(N | n)
		exit 0;;
esac


echo "********************** install docker *********************"
