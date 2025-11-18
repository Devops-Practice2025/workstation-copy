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