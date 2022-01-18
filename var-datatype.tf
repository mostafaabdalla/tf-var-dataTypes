provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "user" {
  name = var.usernumber
}

resource "aws_elb" "bar" {
  name               = var.elb_name
  availability_zones = var.az

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

  tags = {
    Name = "foobar-terraform-elb"
  }
}

resource "aws_instance" "myec2" {
  ami           = "ami-08e4e35cccc6189f4"
  instance_type = var.types["us-west-1"]
}