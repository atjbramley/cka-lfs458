terraform {
  required_version = ">= 1.3"

  required_providers {

    bitwarden-secrets = {
      source  = "registry.terraform.io/bitwarden/bitwarden-secrets"
      version = "0.5.4-pre"
    }
    google = {
      source  = "hashicorp/google"
      version = "~>5.0"
    }
  }
}

# Uncomment this module to test Bitwarden Secrets Manager integration
# module "bitwarden_sm_check" {
#   source = "./modules/bitwarden-sm-check"
#   bitwarden_access_token = var.bitwarden_access_token
# }

# Uncomment this module to test the GCP connection by creating a test GCS bucket
# module "test_bucket" {
#   source      = "./modules/gcs-bucket"
#   location    = var.gcp_region
#   bucket_name = "tf-test-bucket-${random_id.suffix.hex}"
# }

# Initial setup for GCP VPC network + CP VM instance
module "intro-gcp-vcp-network" {
  source   = "./modules/intro-gcp-vpc-network"
  location = var.gcp_region
  project  = var.gcp_project_id

  providers = {
    google = google
  }
}
