variable "tools" {
  default = {
    workstation = {
      instance_type = "t2.large"
      policy_name = ["AdministratorAccess"]
    }
        vault = {
      instance_type = "t2.medium"
      policy_name = []
    }

  }
}
variable "domain_name" {
  default = "karthi.online"
}
