resource "aws_instance" "workstation" {
  ami = data.aws_ami.workstation-ami.image_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}