resource "bitwarden-secrets_secret" "tf-created-example-module" {
  key        = "TF-created-secret-1-module"
  note       = "An example secret managed by Bitwarden Secrets Manager created from a dedicated module"
  project_id = "244ff7ec-1efe-4684-a0b1-b36200a55865"
}