resource "aws_instance" "workstation" {
  ami = data.aws_ami.workstation-ami.image_id
  instance_type = var.instance_type

  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.sg_id]

  root_block_device {
    volume_size = 50
    volume_type = "gp3"      #increase volume to 50gb
    delete_on_termination = true

  }


  tags = {
    Name = var.instance_name
  }
} 

