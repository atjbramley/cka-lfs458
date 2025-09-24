# Example output to list all secrets the access token has access to
output "secrets" {
  value = data.bitwarden-sm_list_secrets.secrets.secrets
}

# Example output to list all projects the access token has access to
output "projects" {
  value = data.bitwarden-sm_projects.projects.projects
}

# Example output for specific secrets
output "example_secret_1" {
  value = {
    id              = data.bitwarden-sm_secret.example_secret1.id
    key             = data.bitwarden-sm_secret.example_secret1.key
    note            = data.bitwarden-sm_secret.example_secret1.note
    project_id      = data.bitwarden-sm_secret.example_secret1.project_id
    organization_id = data.bitwarden-sm_secret.example_secret1.organization_id
    creation_date   = data.bitwarden-sm_secret.example_secret1.creation_date
    revision_date   = data.bitwarden-sm_secret.example_secret1.revision_date
  }
}

output "example_secret_2" {
  value = {
    id              = data.bitwarden-sm_secret.example_secret2.id
    key             = data.bitwarden-sm_secret.example_secret2.key
    note            = data.bitwarden-sm_secret.example_secret2.note
    project_id      = data.bitwarden-sm_secret.example_secret2.project_id
    organization_id = data.bitwarden-sm_secret.example_secret2.organization_id
    creation_date   = data.bitwarden-sm_secret.example_secret2.creation_date
    revision_date   = data.bitwarden-sm_secret.example_secret2.revision_date
  }
}

# Example of setting a secret in Bitwarden Secrets Manager from Terraform
output "example_secret_created_by_terraform" {
  value = {
    id              = resource.bitwarden-sm_secret.tf-created-example.id
    key             = resource.bitwarden-sm_secret.tf-created-example.key
    note            = resource.bitwarden-sm_secret.tf-created-example.note
    project_id      = resource.bitwarden-sm_secret.tf-created-example.project_id
    organization_id = resource.bitwarden-sm_secret.tf-created-example.organization_id
    creation_date   = resource.bitwarden-sm_secret.tf-created-example.creation_date
    revision_date   = resource.bitwarden-sm_secret.tf-created-example.revision_date
  }
}
