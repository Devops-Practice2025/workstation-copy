terraform {
  backend "s3" {
    bucket = "karthi-bucket2025"
    key = "mystate/terraform.tfstate"
    region = "us-east-1"
  }
}
