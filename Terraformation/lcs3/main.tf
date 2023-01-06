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
  access_key = "4FEOOBCVWCTNNB1A"
  secret_key = "TJ53Z0QX2F0G2KU5Z5TVRKREBXNF2CDO"
  endpoint_url = "https://s3.us-east-1.lyvecloud.seagate.com"



 //account api - optional
  client_id = "528S9InufaWUCFMLDoEqN7WnLDTY2Ohz"
  client_secret = "OobLmy-HP0PrGP4W9YJboxcQ3-MG2h4NIj7gWhPeHyvcXyVyLRdRZePSmAA6HJH5"
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