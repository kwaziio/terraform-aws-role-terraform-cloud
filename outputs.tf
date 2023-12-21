####################################################################
# Provides Information About Role Resources Created by this Module #
####################################################################

output "id" {
  description = "ARN Assigned to the AWS IAM Role Created by this Module"
  value       = aws_iam_role.terraform_cloud.arn
}

output "info" {
  description = "General Information About Resources Created by this Module (Unstable)"

  value = {
    unique_id = aws_iam_role.terraform_cloud.arn

    attached_policies = [

    ]
  }
}

output "name" {
  description = "Name Assigned to the AWS IAM Role Created by this Module"
  value       = aws_iam_role.terraform_cloud.name
}

output "tags" {
  description = "Map of Tags Assigned to the AWS IAM Role Created by this Module"
  value       = aws_iam_role.terraform_cloud.tags_all
}
