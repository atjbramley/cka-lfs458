resource "google_storage_bucket" "test_bucket" {
  name          = var.bucket_name
  location      = var.location
}