# CI/CD Integration with Terraform Workspaces
resource "null_resource" "terraform_apply" {
  provisioner "local-exec" {
    command = "terraform workspace select ${var.environment} || terraform workspace new ${var.environment}"
  }
}
