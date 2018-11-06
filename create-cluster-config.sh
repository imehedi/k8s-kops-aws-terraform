#!/usr/bin/env bash
export KOPS_STATE_STORE=s3://my-bucket-name
export NAME=domain.com

kops create cluster \
     --zones eu-west-1a,eu-west-1b,eu-west-1c \
     $NAME \
     --state=$KOPS_STATE_STORE \
     --dry-run=true \
     --output=yaml \
     --admin-access="0.0.0.0/0" \
     --cloud=aws \
     --encrypt-etcd-storage=true \
     --ssh-public-key="~/.ssh/id_rsa.pub" \
     --master-zones eu-west-1a,eu-west-1b,eu-west-1c \
     --master-count=3 \
     --master-size="t2.micro" \
     --master-volume-size=30 \
     --api-loadbalancer-type="internal" \
     --api-ssl-certificate="arn:aws:acm:us-east-1:704552746913:certificate/bb3b310f-df6b-459a-8a84-e1f218639c39" \
     --associate-public-ip=true \
     --authorization="RBAC" \
     --node-size="t2.micro" \
     --node-count=3 \
     --node-volume-size=30 \
     --networking="weave" \
     --topology="private" \
     --bastion=true \
     --out=. \
     --target=terraform

terraform init
terraform plan
terraform apply 
