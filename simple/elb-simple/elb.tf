resource "aws_elb" "elb" {
  name                        = "${var.name}-elb"
  subnets                     = ["${aws_subnet.frontend_subnet.*.id}"]
  instances                   = ["${aws_spot_instance_request.web.*.spot_instance_id}"]
  idle_timeout                = 60
  security_groups             = ["${aws_security_group.elb.id}"]
  connection_draining         = true
  connection_draining_timeout = 300
  cross_zone_load_balancing   = true

  listener {
    lb_port            = 443
    lb_protocol        = "https"
    instance_port      = 80
    instance_protocol  = "http"
    ssl_certificate_id = "${var.elb_config["acm_arn"]}"
  }

  health_check {
    timeout             = 5
    target              = "HTTP:80/index.html"
    interval            = 30
    healthy_threshold   = 10
    unhealthy_threshold = 2
  }

  access_logs {
    bucket        = "${aws_s3_bucket.elb_log.bucket}"
    bucket_prefix = "demo"
    interval      = 60
  }
}
