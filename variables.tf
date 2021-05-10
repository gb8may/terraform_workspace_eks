variable "aws_region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "<CLUSTER_NAME>"
}

variable "cluster_version" {
  default = "<CLUSTER_VERSION>"
}

variable "instance_type" {
  default = "<INSTANCE_TYPE>"
}

variable "provider_env_roles" {
  type    = map
  default = {
    "staging" = "arn:aws:iam::<AWS_ACCOUNT_ID>:role/<IAM_ROLE>"
    "prod"    = "arn:aws:iam::<AWS_ACCOUNT_ID>:role/<IAM_ROLE>"
  }
}

variable "aws_account" {
  default = "<AWS_ACCOUNT_ID>"
}

variable "aws_role" {
  default = "<IAM_ROLE>"
}
