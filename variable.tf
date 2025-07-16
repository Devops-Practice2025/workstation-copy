variable "tools" {
  default = {
    workstation = {
      instance_type = "t2.medium"
    }
    github_runner = {
      instance_type = "t2.medium"
    }
  }
}
