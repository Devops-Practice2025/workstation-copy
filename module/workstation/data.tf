data "aws_ami" "workstation-ami" {
  id = "ami-09c813fb71547fc4f"
  name_regex       = "RHEL-9-DevOps-Practice"
  owners           = ["973714476881"]

}
