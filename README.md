<h1 align="center"> 
	Terraform Workspace & EKS
</h1>


### 🛠 Tools:
- ![AWS](https://img.shields.io/badge/-AWS-232F3E?&logo=amazon%20aws&logoColor=FFFFFF) ![Kubernetes](https://img.shields.io/badge/-Kubernetes-326CE5?&logo=kubernetes&logoColor=FFFFFF) ![Terraform](https://img.shields.io/badge/-Terraform-623CE4?&logo=terraform&logoColor=FFFFF)


Setup your environments with tfvars files for each env.

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
