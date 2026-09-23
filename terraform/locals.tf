# secrets.yml lives at the repo root, is gitignored, and is read by both TF and ansible:
#   - Terraform, here, via yamldecode()
#   - Ansible, via a vars_files entry in the install-kubernetes playbook

locals {
  secrets_file = "${path.root}/../secrets.yml"

  # fileexists()/try() keep `tofu plan` working for the GCP-only resources when
  # secrets.yml is absent; the provider only errors if something actually uses it.
  secrets = fileexists(local.secrets_file) ? yamldecode(file(local.secrets_file)) : {}

  bitwarden_access_token = try(local.secrets.bitwarden_access_token, null)
}
