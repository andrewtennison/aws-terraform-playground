variable "name" {
  default = "simple-stg"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "vpc_cidr" {
  default = "172.17.0.0/16"
}

variable "spot_config" {
  default = {
    instance_type        = "c3.large"
    price                = "0.15"
    wait_for_fulfillment = true
    type                 = "one-time"
  }
}
