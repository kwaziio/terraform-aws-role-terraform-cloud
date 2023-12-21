# Complete Usage Example

This example is intended to show a standard use case for this module with a moderate amount of customization; it also includes the creation of all prerequisite resources:

```HCL
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
  tfc_identity_provider_audience  = "aws.workload.identity"

  resource_tags = {
    Environment = "examples"
    Feature     = "iam"
  }
}
```

## Executing Example Deployment

The following example is provided as guidance, but can also be used for integration testing:

* [https://github.com/kwaziio/terraform-aws-role-terraform-cloud/tree/main/examples/complete](https://github.com/kwaziio/terraform-aws-role-terraform-cloud/tree/main/examples/complete)

### Deploying Complete Example as Integration Test

The following commands will initialize and deploy the infrastructure for the complete example:

```SHELL
terraform -chdir=examples/complete init -reconfigure
terraform -chdir=examples/complete apply
```

### Destroying Complete Example After Integration Test

The following command will destroy any resources created while deploying the complete example:

```SHELL
terraform -chdir=examples/complete destroy
```
