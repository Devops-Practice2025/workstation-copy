variable "tools" {
  default = {
    workstation = {
      instance_type = "t2.large"
      role = "ec2-role"
      policy_name = ["AdministratorAccess"]
    }
        vault = {
      instance_type = "t2.medium"
      role = "vault-role"
      policy_name = []
    }

  }
}
variable "domain_name" {
  default = "karthi.online"
}
