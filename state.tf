terraform {
  backend "s3" {
    bucket = "karthi-bucket20251"
    key = "mystate/terraform.tfstate"
    region = "us-east-1"
  }
}
