provider "google" {
  project = var.gcp_project_id
  region = var.gcp_region
  credentials = file(var.credentials_file)
}

provider "bitwarden-secrets" {
  api_url         = "https://api.bitwarden.com"
  identity_url    = "https://identity.bitwarden.com"
  access_token    = var.bitwarden_access_token
  organization_id = "d8036b70-0b7f-4c86-adca-ae970103ab42"
}
