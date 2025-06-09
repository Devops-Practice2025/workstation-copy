provider "aws" {
  region = "us-west-1"
}

module "workstation" {
  source = "./module/workstation"
  instance_name = "workstation"
  instance_type = "t2.medium"
}
module "vpc" {
  source = "./module/vpc"
 }