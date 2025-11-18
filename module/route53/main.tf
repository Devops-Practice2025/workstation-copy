resource "aws_route53_zone" "private" {
  
  name = var.domain_name

  comment = "private hosted zone for ${var.domain_name}"
  force_destroy = false

  tags =  {
    Name = "private-${var.domain_name}"
  }
  }


resource "aws_route53_record" "record-public" {
  zone_id = aws_route53_zone.private.zone_id
  name    = var.name
  type    = "A"
  ttl     = 10
  records = [var.instance.public_ip]
}

resource "aws_route53_record" "record-private" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "${var.name}-internal"
  type    = "A"
  ttl     = 10
  records = [var.instance.private_ip]
}