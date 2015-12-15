provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

resource "aws_iam_group" "chap3-3-2-iam-group" {
  name = "chap3-3-2-my-iam-group"
  path = "/"
}

resource "aws_iam_group_policy" "chap3-3-2-iam-group-policy" {
  name = "${aws_iam_group.chap3-3-2-iam-group.name}"
  group = "${aws_iam_group.chap3-3-2-iam-group.id}"
  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOT
}

resource "aws_iam_user" "chap3-3-2-iam-user" {
  name = "chap3-3-2-iam-user"
}

resource "aws_iam_group_membership" "chap3-3-2-iam-membership" {
  name = "chap3-3-2-iam-membership"
  users = [
    "${aws_iam_user.chap3-3-2-iam-user.name}"
  ]
  group = "${aws_iam_group.chap3-3-2-iam-group.name}"
}

resource "aws_s3_bucket" "chap3-3-2-s3-bucket" {
  bucket = "${var.aws_s3_bucket}"
  acl = "public-read"
  policy = "${file("policy.json")}"
  force_destroy = true
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "chap3-3-2-s3-bucket-object-index" {
  bucket = "${aws_s3_bucket.chap3-3-2-s3-bucket.bucket}"
  key = "index.html"
  source = "index.html"
  content_type = "text/html"
}
resource "aws_s3_bucket_object" "chap3-3-2-s3-bucket-object-error" {
  bucket = "${aws_s3_bucket.chap3-3-2-s3-bucket.bucket}"
  key = "error.html"
  source = "error.html"
  content_type = "text/html"
}

resource "aws_route53_zone" "chap3-3-2-route53-zone" {
  name = "${var.aws_hosted_zone}"
}

resource "aws_route53_record" "chap3-3-2-route53-record" {
  zone_id = "${aws_route53_zone.chap3-3-2-route53-zone.zone_id}"
  name = "${var.aws_s3_bucket}"
  type = "CNAME"
  ttl = "300"
  records = [
    "${aws_s3_bucket.chap3-3-2-s3-bucket.website_endpoint}"
  ]
}

output "s3 endpoint" {
  value = "${aws_s3_bucket.chap3-3-2-s3-bucket.website_endpoint}"
}
