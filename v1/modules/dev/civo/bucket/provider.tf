terraform {

  required_version = ">= 0.13.0"

  required_providers {
    civo = {
      source  = "civo/civo"
      version = "~> 1.1.0"
    }
  }
}


provider "civo" {
  token = var.civo-token
  region = var.region
}
