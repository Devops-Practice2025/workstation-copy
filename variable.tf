variable "tools" {
  default = {
    workstation = {
      instance_type = "t2.large"
    }
        vault = {
      instance_type = "t2.medium"
    }

  }
}
