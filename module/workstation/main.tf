resource "aws_instance" "tool" {
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
    Name = var.name
  }
} 


resource "aws_iam_role" "ec2_role" {
  name  = var.role


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
  
lifecycle {
    prevent_destroy = true
    ignore_changes  = [name]
  }

}
resource "aws_iam_role_policy_attachment" "policy-attach" {
  count      = length(var.policy_name)
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/${var.policy_name[count.index]}"
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_route53_zone" "public" {
  
  name = var.domain_name

  comment = "Public hosted zone for ${var.domain_name}"
  force_destroy = false

  tags =  {
    Name = "public-${var.domain_name}"
  }
  }


resource "aws_route53_record" "record-public" {
  zone_id = aws_route53_zone.public.zone_id
  name    = var.name
  type    = "A"
  ttl     = 10
  records = [aws_instance.tool.public_ip]
}

resource "aws_route53_record" "record-private" {
  zone_id = aws_route53_zone.public.zone_id
  name    = "${var.name}-internal"
  type    = "A"
  ttl     = 10
  records = [aws_instance.tool.private_ip]
}



resource "null_resource" "run_ansible_playbook" {
  count = var.name == "workstation" ? 1:0
  depends_on = [
    aws_instance.tool,
    aws_iam_role_policy_attachment.policy-attach,
     # Replace with your actual resource name
  ]

  provisioner "remote-exec" {
    inline = [
      "echo Hello from Terraform!",
      "sudo dnf install ansible -y",
      "git clone https://github.com/Devops-Practice2025/workstation-copy.git",
      "cd ~/workstation-copy/ansible",
      "ansible-playbook -i localhost, -e ansible_user=ec2-user -e ansible_password=DevOps321 main.yml -v"
    ]

    connection {
      type     = "ssh"
      user     = "ec2-user"               # or "ubuntu"
      password = "DevOps321"          # ⚠️ Not secure
      host     = aws_instance.tool.public_ip
    }
  }


  }