# Terraform AWS Terraform Cloud Role Module by KWAZI

Terraform Module for Creating a Standardized IAM Role for Terraform Cloud on AWS

## Getting Started

> NOTE: This section assumes that you have Terraform experience, have already created an AWS account, and have already configured programmatic access to that account via access token, Single-Sign On (SSO), or AWS Identity and Access Management (IAM) role. If you need help, [checkout our website](https://www.kwazi.io).

The simplest way to get started is to create a `main.tf` file with the minimum configuration options. You can use the following as a template:

```HCL
##################################
# Example Terraform Module Usage #
##################################

module "terraform_aws_role_terraform_cloud" {
  source = "kwaziio/aws/role-terraform-cloud"

  tfc_identity_provider_arn      = "OIDC_PROVIDER_ARN"
  tfc_identity_provider_audience = "aws.workload.identity"
}
```

In the example above, you should replace the following templated values:

Placeholder | Description
--- | ---
`OIDC_PROVIDER_ARN` | Replace this w/ the ARN of Your IAM Identity Provider for Terraform Cloud

> TIP: Check [our example](examples/complete/main.tf) for a working example of provisioning the AWS IAM Identity Provider for Terraform Cloud mentioned above.

## Need Help?

Working in a strict environment? Struggling to make design decisions you feel comfortable with? Want help from an expert that you can rely on -- one who won't abandon you when the job is finished?

Check us out at [https://www.kwazi.io](https://www.kwazi.io).

## Major Created Resources

The following table lists resources that this module may create in AWS, accompanied by conditions for when they will or will not be created:

Resource Name | Creation Condition
--- | ---
AWS IAM Role | Always

## Usage Examples

The following examples are provided as guidance:

* [examples/complete](examples/complete/main.tf)
