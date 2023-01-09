
variable "project_id" {
  description = "Google Cloud project ID under which this app infra will be created"
  type = string
}
variable "app_name" {
  description = "Name of the application"
  type = string
}
variable "region"{
  description = "gcp region"
  type = string
}

variable "zone"{
  description = "gcp zone"
  type = string
}

variable "project_management_services"{
  type = list(string)
  default = [ 
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
    "sqladmin.googleapis.com",
    "appengine.googleapis.com"
   ]
}