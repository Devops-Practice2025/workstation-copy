resource "aws_route53_zone" "private_zone" {
  
  name = var.domain_name
  vpc {
    vpc_id = var.vpc_id
  
  }

  comment = "private hosted zone for ${var.domain_name}"
  force_destroy = false

  tags =  {
    Name = "private-${var.domain_name}"
  }
  }

