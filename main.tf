provider "aws" {
  region = "us-east-1"
}

#
module "vpc" {
  source = "./module/vpc"

 }
module "workstation" {
  source = "./module/workstation"
  instance_name = "workstation"
  instance_type = "t2.medium"
  subnet_id = module.vpc.subnet_id
  sg_id = module.vpc.sg_id
}

module "s3" {
  source = "./module/s3"
  bucket = "my-karthi-buket"
  environment = "DEV"  
}
