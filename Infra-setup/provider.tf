terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.47.0"
    }
  }
}

provider "google" {
  # Configuration options
  credentials = "sa.json"
  project = var.project_id
  region  = var.region
}