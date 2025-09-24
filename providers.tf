provider "google" {
  project = "cka-lfs-458"
  region = "europe-west12"
  credentials = file(var.credentials_file)
}

provider "bitwarden-sm" {
  api_url         = "https://api.bitwarden.com"
  identity_url    = "https://identity.bitwarden.com"
  access_token    = var.bitwarden_access_token
  organization_id = "d8036b70-0b7f-4c86-adca-ae970103ab42"
}