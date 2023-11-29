terraform {
  backend "s3" {
    bucket  = "my-user-terraform"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
