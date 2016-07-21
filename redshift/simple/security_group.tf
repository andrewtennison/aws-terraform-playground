resource "aws_security_group" "ec2" {
  name        = "${var.name}-ec2"
  vpc_id      = "${aws_vpc.vpc.id}"
  description = "${replace(var.name, "_", " ")}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "redshift" {
  name        = "${var.name}-redshift"
  vpc_id      = "${aws_vpc.vpc.id}"
  description = "${replace(var.name, "_", " ")}"

  ingress {
    from_port       = 5439
    to_port         = 5439
    protocol        = "tcp"
    security_groups = ["${aws_security_group.ec2.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
