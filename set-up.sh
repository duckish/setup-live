#!/bin/bash

apt install -y python3-pip
# set up aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

# set up node
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
chmod +x nodesource_setup.sh
./nodesource_setup.sh
apt-get install nodejs -y


## UP date node
npm install -g npm@8.19.2

# set up CDK
#RUN npm i -g aws-cdk
#RUN npm i -g aws-cdk@2.43.0
npm i -g aws-cdk@2.47.0

# set up eks-blueprints
# https://aws-quickstart.github.io/cdk-eks-blueprints/getting-started/
npm i -g @aws-quickstart/eks-blueprints

# set up yawsso this will be used to coonect CDK with SSO
pip3 install yawsso

curl -LO https://dl.k8s.io/release/v1.26.3/bin/linux/amd64/kubectl

chmod +x kubectl

mv kubectl /usr/local/bin/

curl -o aws-iam-authenticator https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
chmod +x aws-iam-authenticator

mv aws-iam-authenticator /usr/local/bin

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl /usr/local/bin

wget https://github.com/FairwindsOps/rbac-lookup/releases/download/v0.8.3/rbac-lookup_0.8.3_Linux_x86_64.tar.gz
tar -xvf rbac-lookup_0.8.3_Linux_x86_64.tar.gz
chmod +x rbac-lookup
mv rbac-lookup /usr/local/bin


## set up helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

## set up kubeseal
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.18.1/kubeseal-0.18.1-linux-amd64.tar.gz
tar -xvf kubeseal-0.18.1-linux-amd64.tar.gz
mv kubeseal /usr/local/bin

## set up argoCD
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
chmod +x /usr/local/bin/argocd


## set up krew
./set-up-krew.sh


## set up aws sso until

pip3 install aws-sso-util
