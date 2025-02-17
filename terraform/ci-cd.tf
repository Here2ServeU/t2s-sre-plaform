# CI/CD Integration with Terraform Workspaces
resource "null_resource" "terraform_apply" {
  provisioner "local-exec" {
    command = "terraform workspace select ${local.environment} || terraform workspace new ${local.environment}"
  }
}
