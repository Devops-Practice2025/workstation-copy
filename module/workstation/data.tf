data "aws_ami" "workstation-ami" {

  name_regex       = "RHEL-9-DevOps-Practice"
  owners           = ["973714476881"]

}

data "terraform_remote_state" "vpc"  {
  backend = "s3"
config = {
    bucket = "my-terraform-state-bucket"
    key = "vpc/terraform.tfstate"
    region = "us-east-1"

  }
}
