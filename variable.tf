variable "tools" {
  default = {
    workstation = {
      instance_type = "t2.large"

          }
          vault={
            instance_type = "t3.medium"
          }


  }
}
variable "domain_name" {
  default = "vaanam.work.gd"
}
