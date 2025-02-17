# OPA Policy Enforcement - opa-policies.rego
package kubernetes.admission

deny[msg] {
  input.request.kind.kind == "Pod"
  input.request.object.spec.containers[_].securityContext.runAsRoot == true
  msg := "Running containers as root is not allowed."
}

deny[msg] {
  input.request.kind.kind == "Pod"
  not input.request.object.metadata.labels["security-approved"]
  msg := "Pods must be labeled with 'security-approved' to be deployed."
}
