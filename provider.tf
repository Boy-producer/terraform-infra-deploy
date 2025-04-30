terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.33.0"
    }
  }
}

provider "google" {
 region = "us-cental1"
 credentials = file("lpfkflokefloak[fkg[pfa]]")
 project = "thospuj"
}