data "aws_ami" "workstation-ami" {

  name_regex       = "RHEL-9-DevOps-Practice"
  owners           = ["973714476881"]

}
