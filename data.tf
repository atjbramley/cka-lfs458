# Define secrets data source to list all secrets from Bitwarden Secrets Manager
data "bitwarden-secrets_list_secrets" "secrets" {}

# Define project data source to fetch projects from Bitwarden Secrets Manager
data "bitwarden-secrets_projects" "projects" {}

# Display 2x secret resources as examples
data "bitwarden-secrets_secret" "example_secret1" {
  id = "60a588a7-53cc-4df3-b62f-b36200aac0d8"
}

data "bitwarden-secrets_secret" "example_secret2" {
  id = "d80cf41f-a8b2-4ba2-ae85-b36200b54641"
}
