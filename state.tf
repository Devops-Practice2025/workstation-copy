terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key = "vpc/terraform.tfstate"
    region = "us-west-2"
  }
}