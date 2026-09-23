# GCP service account key for terraform-sa@cka-lfs-458
# Stored as single secret holding the whole JSON key.
#
data "bitwarden-secrets_secret" "gcp_sa_key" {
  id = "2938ae58-07ba-4fcd-9f31-b4ce0099bd79"
}
