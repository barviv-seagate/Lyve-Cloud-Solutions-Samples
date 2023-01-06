provider "lyvecloud" {
  //s3 api
  region = "us-east-1"
  access_key = "2F02BGCKEZWHAWLA"
  secret_key = "MLVQMMWV000YZS5EUG2VOWLP2BYYWCFD"
  endpoint_url = "https://s3.us-east-1.lyvecloud.seagate.com"
}

resource "tfstate_s3_bucket" "terraform_state" {
  bucket = "lyve-tf"
  object_lock_enabled = true
}

