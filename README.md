# k8s-kops-aws-terraform

## What is this repo?
This is a quick start example to spin up a Kubernetes cluster on AWS using terraform plan generated using kops.

## How can I use this?
Copy contents from **```create-cluster-config.sh```** and customise as appropriate (cluster TLD, bucket name, etc). Use this to generate terraform plans and relevant templates (i.e. IAM/Policy/SecurityGroups/Launch Configurations). All other files are given here only as a reference.

```
export KOPS_STATE_STORE=s3://my-bucket-name
export NAME=domain.com
kops create cluster \
     --zones eu-west-1a,eu-west-1b,eu-west-1c \
     $NAME \
     --state=$KOPS_STATE_STORE \
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
     --target=terraform```
     
