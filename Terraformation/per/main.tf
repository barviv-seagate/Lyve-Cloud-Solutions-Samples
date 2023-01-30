terraform {
  required_providers {
    lyvecloud = {
      source = "Seagate/lyvecloud"
      version = "0.1.3"
    }
  }
}

 //account api - optional
  provider "lyvecloud" {
  client_id = "528S9InufaWUCFMLDoEqN7WnLDTY2Ohz"
  client_secret = "OobLmy-HP0PrGP4W9YJboxcQ3-MG2h4NIj7gWhPeHyvcXyVyLRdRZePSmAA6HJH5"
}

resource "lyvecloud_permission" "per" {
  permission = "tf-per"
  description = "permission description"
  actions = "all-operations" // “all-operations”, “read”, or “write”.
  buckets = ["lyveeast"]
}

resource "lyvecloud_service_account" "sa" {
  service_account = "tf-sa"
  description = "service account description"
  permissions = [lyvecloud_permission.per.id]
}

output "key" {
  value = lyvecloud_service_account.sa.access_key
}

output "secret" {
  value = lyvecloud_service_account.sa.access_secret
}