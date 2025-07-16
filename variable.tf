variable "tools" {
  default = {

workstation = {
        instance_type = "t2.medium"
        instance_name = "workstation
        }
    
github_runner = {
        instance_type = "t2.medium"
        instance_name = "github_runner"
        }
    } }
