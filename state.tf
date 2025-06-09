terraform {
  backend "s3" {
    bucket = "my-state-bucket"
    key = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}