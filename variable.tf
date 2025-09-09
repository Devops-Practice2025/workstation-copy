variable "tools" {
  default = {
    workstation = {
      instance_type = "t2.large"
    }
    app_node_1 = {
      instance_type = "t2.medium"
    }

  }
}
