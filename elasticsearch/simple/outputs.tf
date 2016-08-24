output "public_ip" {
  value = "${aws_spot_instance_request.web.public_ip}"
}

output "spot_bid_status" {
  value = "${aws_spot_instance_request.web.spot_bid_status}"
}

output "spot_request_state" {
  value = "${aws_spot_instance_request.web.spot_request_state}"
}

output "spot_instance_id" {
  value = "${aws_spot_instance_request.web.spot_instance_id}"
}

output "es_arn" {
  value = "${aws_elasticsearch_domain.es.arn}"
}

output "es_domain_id" {
  value = "${aws_elasticsearch_domain.es.domain_id}"
}

output "es_endpoint" {
  value = "${aws_elasticsearch_domain.es.endpoint}"
}

output "s3_bucket" {
  value = "${aws_s3_bucket.s3.id}"
}
