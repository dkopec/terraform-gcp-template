variable "gcp_project_name" {
  type = string
}

variable "gcp_project_id" {
  type = string
  default = ""

  # Validation based on documentation here https://cloud.google.com/resource-manager/docs/creating-managing-projects#before_you_begin

  validation {
    condition = (
      length(var.gcp_project_id) == 0 ||
      length(var.gcp_project_id) >= 6 &&
      length(var.gcp_project_id) <= 30
    )
    error_message = "Must be 6 to 30 characters in length."
  }

  validation {
    condition = (
      var.gcp_project_id == "" ||
      can(regex("^[a-z]([-a-z0-9]*[a-z0-9])?", var.gcp_project_id))
    )
    error_message = "First character must be a lowercase letter, and all the following characters must be hyphens, lowercase letters, or digits, except the last character, which cannot be a hyphen."
  }

  # Note: there is no public list of "restricted strings" this needs to be updated as they are identified https://stackoverflow.com/questions/61524122/is-there-a-list-of-restricted-words-for-the-google-cloud-project-id

  validation {
    condition = ( length(var.gcp_project_id) == 0 ? true :
      !contains(lower(var.gcp_project_id), "google") ||
      !contains(lower(var.gcp_project_id), "ssl")
    )
    error_message = "Cannot contain a restricted string."
  }

}

resource "random_pet" "google_project" {
  count = var.gcp_project_id != "" ? 0 : 1
  keepers = {
    "gcp_project_id" = "${var.gcp_project_id}"
  }
}

resource "random_id" "google_project" {
  count = var.gcp_project_id != "" ? 0 : 1
  byte_length = 2

  keepers = {
    "gcp_project_id" = "${var.gcp_project_id}"
  }
}

resource "google_project" "init" {
  name       = "${var.gcp_project_name}"
  project_id = var.gcp_project_id != "" ? "${var.gcp_project_id}" : "${random_pet.google_project[0].id}-${lower(random_id.google_project[0].hex)}"
}

resource "google_service_account" "init" {
  account_id = "${google_project.init.project_id}-sa"
  project = google_project.init.project_id
}
