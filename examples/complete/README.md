# Complete Usage Example

This example is intended to show a standard use case for this module with a moderate amount of customization; it also includes the creation of all prerequisite resources:

```HCL
TODO
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
