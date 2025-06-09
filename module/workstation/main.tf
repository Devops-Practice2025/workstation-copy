data "terraform_remote_state" "vpc"  {
  backend = "s3"
  config = {
    bucket = "my-state-karthi-buket"
    key = "vpc/terraform.tfstate"
    region = "us-east-1"

  }
}

resource "aws_instance" "workstation" {
  ami = data.aws_ami.workstation-ami.image_id
  instance_type = var.instance_type

   subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id
   vpc_security_group_ids = data.terraform_remote_state.vpc.outputs.sg_id


tags = {
    Name = var.instance_name
  }
}