data "aws_ami" "workstation-ami" {

  name_regex       = "RHEL-9-DevOps-Practice"
  owners           = ["973714476881"]

}
data "aws_iam_role" "existing" {

  name = "ec2-managed-role"
  
}