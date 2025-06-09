provider "aws" {
  region = "us-east-1"
}

module "workstation" {
  source = "./module/workstation"
  instance_name = "workstation"
  instance_type = "t2.medium"
}
module "vpc" {
  source = "./module/vpc"
 }