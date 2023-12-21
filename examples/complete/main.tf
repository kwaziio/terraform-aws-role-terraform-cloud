###########################
# Terraform Configuration #
###########################

terraform {
  required_version = ">= 1.6.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.21"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

##############################
# AWS Provider Configuration #
##############################

provider "aws" {
  // DO NOT HARDCODE CREDENTIALS (Use Environment Variables)
}

###################################
# Required Prerequisite Resources #
###################################

data "tls_certificate" "terraform_cloud" {
  url = "https://app.terraform.io"
}

resource "aws_iam_openid_connect_provider" "terraform_cloud" {
  client_id_list  = ["aws.workload.identity"]
  thumbprint_list = data.tls_certificate.terraform_cloud.certificates.*.sha1_fingerprint
  url             = data.tls_certificate.terraform_cloud.url
}

##################################
# Example Terraform Module Usage #
##################################

module "terraform_aws_role_terraform_cloud" {
  source = "../../"

  iam_role_enable_full_iam_access = true
  iam_role_prefix                 = "example-service-"
  tfc_identity_provider_arn       = aws_iam_openid_connect_provider.terraform_cloud.arn

  resource_tags = {
    Environment = "examples"
    Feature     = "iam"
  }
}
