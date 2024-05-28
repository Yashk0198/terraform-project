terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.24.0"
    }
  }
}

provider "google" {
  project = "fifth-winter-415412"
  region = "asia-south1"
  zone = "asia-south1-a"
  credentials = "terraform-owner.json"
}

resource "google_storage_bucket" "GCS" {
    name = "terrform-bucket-tf-sa"  
    location = "asia"
}