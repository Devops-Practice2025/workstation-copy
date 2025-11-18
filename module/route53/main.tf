resource "aws_route53_zone" "private" {
  
  name = var.domain_name

  comment = "private hosted zone for ${var.domain_name}"
  force_destroy = false

  tags =  {
    Name = "private-${var.domain_name}"
  }
  }

