resource "aws_instance" "workstation" {
  ami = data.aws_ami.workstation-ami.image_id
  instance_type = var.instance_type

  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  root_block_device {
    volume_size = 50
    volume_type = "gp3"      #increase volume to 50gb
    delete_on_termination = true

  }
  tags = {
    Name = var.instance_name
  }
} 


resource "aws_iam_role" "ec2_role" {
  name = "ec2-managed-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}
resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess" # Example policy
}
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}


resource "null_resource" "run_ansible_playbook" {
  depends_on = [
    aws_instance.workstation,
    aws_iam_role_policy_attachment.ec2_policy_attachment,
     # Replace with your actual resource name
  ]

  provisioner "remote-exec" {
    inline = [
      "echo Hello from Terraform!",
      "sudo dnf install ansible",
      "git clone https://github.com/Devops-Practice2025/workstation-copy.git",
      "cd ~/workstation-copy/ansible",
      "ansible-playbook -i localhost, -e ansible_user=ec2-user -e ansible_password=DevOps321 main.yml -v"
    ]

    connection {
      type     = "ssh"
      user     = "ec2-user"               # or "ubuntu"
      password = "DevOps321"          # ⚠️ Not secure
      host     = aws_instance.workstation.public_ip
    }
  }


  }