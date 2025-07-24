terraform {

  required_version = ">= 0.13.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.36.1"
    }
  }
}

provider "google" {
  project = "udemyiactraining"
  region  = "us-central1"
  zone    = "us-central1-c"
}
