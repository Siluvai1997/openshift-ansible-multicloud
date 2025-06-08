# OpenShift Multi-Cloud Deployment with Ansible

Provision OpenShift 4.x clusters on Azure and AWS with consistent configuration using Ansible and Terraform. This repository is useful for delivering hybrid/multi-cloud OpenShift solutions.

## Tools Used
- Ansible (for OpenShift install, operators, networking)
- Terraform (for infrastructure provisioning)
- OpenShift Installer (UPI-based install, customizable)

## Features
- Infrastructure provisioning on AWS and Azure using Terraform
- Ansible-driven OpenShift install workflow (can integrate with installer)
- Foundation for Day 0/Day 1 platform automation
- Easily extensible to include logging, monitoring, and operators

## Prerequisites
- Terraform installed and authenticated for AWS and Azure
- Ansible and `oc` CLI configured
- OpenShift installer binary available in your local PATH
- Access to credentials/configuration for both clouds

## Usage

### 1. Provision Infrastructure on AWS

```
cd terraform/aws
terraform init
terraform apply
```

### 2. Provision Infrastructure on Azure

```
cd terraform/azure
terraform init
terraform apply
```

### 3. Run OpenShift Installation (Ansible-based)

Navigate to the Ansible directory and run:

```
cd ansible
ansible-playbook playbooks/install-openshift.yml -e "platform=aws"
```

You can change the `platform` variable to `azure` as needed.

## Testing the Project

To test the infrastructure layer separately, you can:
- Run `terraform plan` in each cloud's subdirectory
- Validate output by checking the AWS VPC or Azure Resource Group via console

To simulate OpenShift install, the Ansible playbook currently prints debug messages — this can be extended to include `openshift-install` CLI commands or REST API-based installation steps for managed services.

## Repo Structure

```
.
├── terraform/
│   ├── aws/
│   │   └── main.tf              # VPC setup for OpenShift on AWS
│   └── azure/
│       └── main.tf              # Resource Group for OpenShift on Azure
├── ansible/
│   └── playbooks/
│       └── install-openshift.yml   # Ansible install logic placeholder
└── README.md
```

## Notes
- This repo is structured for consulting demos or extensions — integrate secrets management, logging, and monitoring as needed.
- Works well for PoC environments or training projects.
