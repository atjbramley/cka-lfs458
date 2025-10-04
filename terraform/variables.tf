variable "bitwarden_access_token" {
  description = "The Bitwarden Secrets Manager access token"
  type        = string
  sensitive   = true
}

variable "gcp_project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "cka-lfs-458"
}

variable "gcp_region" {
  description = "The GCP region"
  type        = string
  default     = "europe-west12"
}

variable "gcp_zone" {
  description = "The GCP zone"
  type        = string
  default     = "europe-west12-c"
}

variable "credentials_file" {
  description = "Path to the GCP credentials JSON file"
  type        = string
  default     = "credentials/terraform-sa-key.json"
}
