terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
    google = {
      source = "hashicorp/google"
      version = "4.47.0"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "google" {
  # Configuration options
}