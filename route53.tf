resource "aws_route53_zone" "dev" {
  name          = "dev.userroot.com"
  force_destroy = false
  vpc {
    vpc_id = aws_vpc.main1.id
  }
}

resource "aws_route53_record" "server1" {
  zone_id = aws_route53_zone.dev.zone_id
  name    = "server1.dev.userroot.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.Server1.private_ip]
}

resource "aws_route53_record" "server2" {
  zone_id = aws_route53_zone.dev.zone_id
  name    = "server2.dev.userroot.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.Server2.private_ip]
}

resource "aws_route53_record" "server3" {
  zone_id = aws_route53_zone.dev.zone_id
  name    = "server3.dev.userroot.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.Server3.private_ip]
}

resource "aws_route53_record" "nmy_elb_nameame" {
  zone_id = aws_route53_zone.dev.zone_id
  name    = "mylb.dev.userroot.com"
  type    = "CNAME"
  ttl     = 300
  records = [aws_elb.myElb.dns_name]
}
