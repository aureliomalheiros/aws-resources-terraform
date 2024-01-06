provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "my-user-terraform"
    key     = "k8s/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}