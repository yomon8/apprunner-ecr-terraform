variable "aws_profile" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "local_image_name" {
  type = string
}

variable "local_image_tag" {
  type = string
}

variable "image_name" {
  type    = string
  default = "apprunner-sample"
}

variable "image_tag" {
  type    = string
  default = "sample"
}

variable "service_name" {
  type    = string
  default = "apprunner-sample"
}

variable "container_port" {
  type    = string
  default = "80"
}
