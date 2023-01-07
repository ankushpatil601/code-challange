resource "google_project_service" "project_management_services" {
  count   = length(var.project_management_services)
  project = var.project_id
  service = element(var.project_management_services, count.index)
  disable_dependent_services = true
}