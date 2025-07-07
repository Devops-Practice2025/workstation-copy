terraform {
  backend "s3" {
    bucket = "my-state-karthi-buket"
    key = "mystate/terraform.tfstate"
    region = "us-east-1"
  }
}
