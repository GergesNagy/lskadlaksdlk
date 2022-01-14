# SIMPLE PYTHON APP DEPLOYMENT USING TERRAFORM&GCP.

A simple python web-app using [redis](https://redis.io/) for caching, Deployed on a full GKE cluster using [Terraform](https://www.terraform.io/)

## Infrastructure

A VPC containing 2 subnets, Nat gate-way, Private VM instance and a private standard GKE cluster.

## gke components

Two deployment files to deploy the python application and redis service

## Installation

- Use the package manager [pip](https://pypi.org/project/pip/) to install the dependencies into your Docker file.

```bash
RUN pip install -r requirements.txt
```
- Apply the infrastructure on GCP using Terraform.

```bash
terraform init 
terraform plan
terraform apply
```

- SSH into the private instance and start deploying your gke cluster

```bash
kubectl apply -f "add file name here"
```

## result image
![alt text](https://github.com/EslamHamada2/Terraform-GKE-deployment/blob/main/result.png?raw=true)