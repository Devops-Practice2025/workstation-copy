variable "tools" {
  default = {
    workstation = {
      instance_type = "t2.large"
      role = "ec2-role"
      policy_name = ["AdministratorAccess"]
      profile = "ec2-profile"
          }


  }
}
variable "domain_name" {
  default = "vaanam.work.gd"
}
