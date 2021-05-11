<h1 align="center"> 
	Terraform Workspace & EKS
</h1>

### 🛠 Tools:
- ![AWS](https://img.shields.io/badge/-AWS-232F3E?&logo=amazon%20aws&logoColor=FFFFFF) ![Kubernetes](https://img.shields.io/badge/-Kubernetes-326CE5?&logo=kubernetes&logoColor=FFFFFF) ![Terraform](https://img.shields.io/badge/-Terraform-623CE4?&logo=terraform&logoColor=FFFFF)

---

*Create several environments in different AWS accounts, one account for each environment, creating from AWS DevOps/Root account, like the diagram below:*

![AWS Diagram](https://user-images.githubusercontent.com/35708820/117672283-b3c21e00-b177-11eb-8208-d3a005dfea3d.png)

## Create IAM roles

> DevOps Account:

Add the assume role policy on DevOps/Root account
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "sts:AssumeRole"
      ],
      "Resource": "arn:aws:iam::<PROD OR STAGING ACCOUNT ID>:role/<ROLE NAME>"
    }
  ]
}

```
Attach the policy!

> Prod/Staging Account:

Create manually the role to assume on environment (Prod and Staging) account:

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::<DEVOPS/ROOT ACCOUNT>:root"
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}

```

## Setup workspace configuration with .tfvars files for each environment

```
# Prod.tfvars - Production Environment

aws_region  = "us-east-1"
aws_account = "<AWS_ACCOUNT_ID>"
aws_role   = "<IAM_CROSS_ACCOUNT_ROLE>"
```
```
# Staging.tfvars - Staging Environment

aws_region  = "us-east-1"
aws_account = "<AWS_ACCOUNT_ID>"
aws_role   = "<IAM_CROSS_ACCOUNT_ROLE>"
```

## Steup provider with assume role
```
# Main.tf file

provider "aws" {
  region = var.aws_region
  assume_role {
    role_arn = var.provider_env_roles[terraform.workspace]
  }
}
```
```
# Variables.tf file

variable "provider_env_roles" {
  type    = map
  default = {
    "staging" = "arn:aws:iam::<AWS_ACCOUNT_ID>:role/<IAM_ROLE>"
    "prod"    = "arn:aws:iam::<AWS_ACCOUNT_ID>:role/<IAM_ROLE>"
  }
}
```

## Create Terraform Workspaces
```
% terraform init

% terraform workspace new prod
% terraform workspace new staging
% terraform workspace select staging

% terraform plan --var-file staging.tfvars

% terraform apply --var-file staging.tfvars
```

###### Terraform Version: v0.13.7

```
terraform {
  backend "s3" {
    bucket               = "<BUCKET_NAME>"
    workspace_key_prefix = "<PROJECT_NAME>"
    key                  = "<FILE.tfstate>"
    region               = "us-east-1"
  }
}
```
