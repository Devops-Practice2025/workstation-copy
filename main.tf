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
  name = each.key
  instance_type = each.value["instance_type"]
  subnet_id = module.vpc.subnet_id
  sg_id = module.vpc.sg_id
  policy_name = each.value["policy_name"]
  domain_name = var.domain_name
  role = each.value["role"]
  profile = each.value["profile"]
}

module "route53" {
  source = "/module/route53"
  for_each = var.tools
  domain_name = var.domain_name
  name = each.key

}
