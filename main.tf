provider "aws" {
  region = "us-east-1"
}

#
module "vpc" {
  source = "./module/vpc"

 }
module "workstation" {  
  for_each = var.tools
  source = "./module/workstation"
  instance_name = each.key
  instance_type = each.value["instance_type"]
  subnet_id = module.vpc.subnet_id
  sg_id = module.vpc.sg_id
}

module "s3" {
  source = "./module/s3"
  bucket = "karthi-bucket2025"
  environment = "DEV"  
}
