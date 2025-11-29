variable "tools" {
  default = {
    workstation = {
      instance_type = "t2.large"
      role = "ec2-role"
      policy_name = ["AdministratorAccess"]
      profile = "ec2-profile"
          }
        vault = {
      instance_type = "t2.medium"
      role = "vault-role"
      policy_name = []
      profile = "vault-profile"
      
    }
            github-runner = {
      instance_type = "t2.large"
      role = "grunner-role"
      policy_name = ["AdministratorAccess"]
      profile = "gunner-profile"
      
    }

  }
}
variable "domain_name" {
  default = "vaanam.work.gd"
}
