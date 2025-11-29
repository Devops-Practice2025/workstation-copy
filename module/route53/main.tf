resource "aws_route53_zone" "public" {
  
  name = var.domain_name

  comment = "public hosted zone for ${var.domain_name}"
  force_destroy = false

  tags =  {
    Name = "private-${var.domain_name}"
  }
  }

