resource "random_id" "suffix" {
  byte_length = 4
}

# Pass GCP service account key for use in  Ansible's gcp_compute inventory plugin
# Terraform owns the lifecycle
resource "local_sensitive_file" "ansible_gcp_creds" {
  content         = data.bitwarden-secrets_secret.gcp_sa_key.value
  filename        = "${path.root}/../ansible/.gcp-sa-key.json"
  file_permission = "0600"
}
