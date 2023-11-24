resource "aws_elb" "myElb" {
  name = "my-elb"
  # availability_zones = [
  #   "us-east-2a",
  #   "us-east-2b",
  #   "us-east-2c"
  # ]
  subnets = [aws_subnet.Public_Subnet_1.id, aws_subnet.Public_Subnet_2.id, aws_subnet.Public_Subnet_3.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 10
  }
  instances                   = [aws_instance.Server1.id, aws_instance.Server2.id, aws_instance.Server3.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  security_groups = [aws_security_group.elb_http.id]
  tags = {
    Name = "my_elb"
  }
}

resource "aws_security_group" "elb_http" {
  name        = "elb_http"
  description = "Allow traffic to elb"
  vpc_id      = aws_vpc.main1.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "elb_http"
  }
}
