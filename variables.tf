###############################################################
# AWS Identity and Access Management (IAM) Role Configuration #
###############################################################

variable "iam_role_enable_full_iam_access" {
  default     = false
  description = "'true' if Full AWS IAM Access Should be Granted (Managed Policy)"
  type        = bool
}

variable "iam_role_name" {
  default     = "terraform-cloud"
  description = "Name to Assign to the Created AWS IAM Role"
  type        = string
}

variable "iam_role_permissions_boundary" {
  default     = null
  description = "Permissions Boundary to Assign to the Created AWS IAM Role (Optional)"
  type        = string
}

variable "iam_role_prefix" {
  default     = null
  description = "Name Prefix to Assign to the Created AWS IAM Role"
  type        = string
}

##################################
# Created Resource Configuration #
##################################

variable "resource_tags" {
  default     = {}
  description = "Map of AWS Resource Tags to Assign to All Created Resources"
  type        = map(string)
}

#######################################
# Terraform Cloud (TFC) Configuration #
#######################################

variable "tfc_identity_provider_arn" {
  description = "ARN Assigned to the Terraform Cloud OIDC Identity Provider"
  type        = string
}

variable "tfc_identity_provider_audience" {
  default     = "aws.workload.identity"
  description = "Audience Value Expected by the Terraform Cloud OIDC Identity Provider"
  type        = string
}

variable "tfc_identity_provider_name" {
  default     = "app.terraform.io"
  description = "Name Assigned to the Terraform Cloud OIDC Identity Provider"
  type        = string
}
