terraform {
  backend "s3" {
    bucket = "my-state-karthi-buket"
    key = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}