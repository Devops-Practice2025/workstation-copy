variable "tools" {
  default = {
    workstation = {
      instance_type = "t2.large"
      role = "ec2-role"
      policy_name = ["AdministratorAccess"]
      profile = "ec2-profile"
      instance = "workstation"
    }
        vault = {
      instance_type = "t2.medium"
      role = "vault-role"
      policy_name = []
      profile = "vault-profile"
      instance = "vault"
    }

  }
}
variable "domain_name" {
  default = "karthi.online"
}
