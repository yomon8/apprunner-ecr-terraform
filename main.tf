terraform {
  required_providers {
    aws = {
      version = "= 4.43.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

data "aws_caller_identity" "self" {
}

module "ecr" {
  source           = "./modules/ecr"
  aws_account_id   = data.aws_caller_identity.self.account_id
  aws_region       = var.aws_region
  aws_profile      = var.aws_profile
  image_name       = var.image_name
  image_tag        = var.image_tag
  local_image_name = var.local_image_name
  local_image_tag  = var.local_image_tag
}

module "service" {
  source           = "./modules/apprunner"
  service_name     = var.service_name
  port             = var.container_port
  image_identifier = "${module.ecr.image_url}:${var.image_tag}"
}
