provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region

  # Read from Bitwarden SM 
  # Terraform can resolve this during plan as data source's own config is a literal ID
  # so known before providers configure.
  credentials = data.bitwarden-secrets_secret.gcp_sa_key.value
}

provider "bitwarden-secrets" {
  api_url         = "https://api.bitwarden.com"
  identity_url    = "https://identity.bitwarden.com"
  access_token    = sensitive(local.bitwarden_access_token)
  organization_id = "d8036b70-0b7f-4c86-adca-ae970103ab42"
}
