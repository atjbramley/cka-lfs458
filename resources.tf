resource "bitwarden-sm_secret" "tf-created-example" {
  key        = "TF-created-secret-1"
  note       = "An example secret managed by Bitwarden Secrets Manager which is great"
  project_id = "244ff7ec-1efe-4684-a0b1-b36200a55865"
}

resource "random_id" "suffix" {
  byte_length = 4
}
