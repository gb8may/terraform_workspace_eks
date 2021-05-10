<h1 align="center"> 
	Terraform Workspace & EKS
</h1>

### 🛠 Tools:
- ![AWS](https://img.shields.io/badge/-AWS-232F3E?&logo=amazon%20aws&logoColor=FFFFFF) ![Kubernetes](https://img.shields.io/badge/-Kubernetes-326CE5?&logo=kubernetes&logoColor=FFFFFF) ![Terraform](https://img.shields.io/badge/-Terraform-623CE4?&logo=terraform&logoColor=FFFFF)



*Create several environments in different AWS accounts, one account for each environment, creating from AWS DevOps/Root account, like the diagram below:*

![AWS Diagram](https://user-images.githubusercontent.com/35708820/117672283-b3c21e00-b177-11eb-8208-d3a005dfea3d.png)

- Create IAM roles

- Setup your environments with tfvars files for each env.

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
