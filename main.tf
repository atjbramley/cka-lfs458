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

module "test_bucket" {
  source      = "./modules/gcs-bucket"
  location    = var.gcp_region
  bucket_name = "tf-test-bucket-${random_id.suffix.hex}"
}
