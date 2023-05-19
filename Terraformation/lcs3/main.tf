terraform {
  required_providers {
    lyvecloud = {
      source = "Seagate/lyvecloud"
      version = "0.1.3"
    }
  }
}



provider "lyvecloud" {
  //s3 api - optional
  region = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
  endpoint_url = "https://s3.us-east-1.lyvecloud.seagate.com"



 //account api - optional
  client_id = "XXXX"
  client_secret = "XXXX"
}


resource "lyvecloud_s3_bucket" "lck" {
  bucket = "tf-lck-bucket"
  object_lock_enabled = true
  tags = {
    Name        = "tflockbucket"
    Environment = "tf"
  }
}

resource "lyvecloud_s3_bucket_object_lock_configuration" "loc" {
  bucket = "tf-lck-bucket"

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 20
    }
  }
}
