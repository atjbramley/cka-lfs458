terraform {
  required_version = ">= 1.3"

  required_providers {
    bitwarden-sm = {
      source  = "bitwarden/bitwarden-sm"
      version = "0.5.2"
    }
    google = {
      source  = "hashicorp/google"
      version = "~>5.0"
    }
  }
}

module "test_bucket" {
  source       = "./modules/gcs-bucket"
  location     = var.gcp_region
  bucket_name  = "tf-test-bucket-${random_id.suffix.hex}"
}
