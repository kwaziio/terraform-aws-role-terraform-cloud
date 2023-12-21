########################################################
# Retrieves AWS Managed IAM Policy for Full IAM Access #
########################################################

data "aws_iam_policy" "iam_full_access" {
  count = var.iam_role_enable_full_iam_access ? 1 : 0
  name  = "IAMFullAccess"
}

##########################################################
# Retrieves AWS Managed IAM Policy for Power User Access #
##########################################################

data "aws_iam_policy" "power_user_access" {
  name = "PowerUserAccess"
}

####################################################################################################
# Creates AWS Identity and Access Management (IAM) Assume Role Policy for Federated OIDC Providers #
####################################################################################################

data "aws_iam_policy_document" "assume_role_federated_oidc" {
  version = "2012-10-17"

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${var.tfc_identity_provider_name}:aud"
      values   = [var.tfc_identity_provider_audience]
    }

    principals {
      identifiers = [var.tfc_identity_provider_arn]
      type        = "Federated"
    }
  }
}

#############################################################################
# Creates AWS Identity and Access Management (IAM) Role for Terraform Cloud #
#############################################################################

resource "aws_iam_role" "terraform_cloud" {
  assume_role_policy   = data.aws_iam_policy_document.assume_role_federated_oidc.json
  description          = "Assigns Access Policies to the Terraform Cloud Service Account"
  name                 = "${var.iam_role_prefix}${var.iam_role_name}"
  permissions_boundary = var.iam_role_permissions_boundary
  tags                 = var.resource_tags
}

#############################################################
# Attaches Policies to the AWS IAM Role for Terraform Cloud #
#############################################################

resource "aws_iam_role_policy_attachment" "iam_full_access" {
  count      = var.iam_role_enable_full_iam_access ? 1 : 0
  policy_arn = one(data.aws_iam_policy.iam_full_access).arn
  role       = aws_iam_role.terraform_cloud.name
}

resource "aws_iam_role_policy_attachment" "power_user_access" {
  policy_arn = data.aws_iam_policy.power_user_access.arn
  role       = aws_iam_role.terraform_cloud.name
}
