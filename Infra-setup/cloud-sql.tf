
resource "google_sql_database" "database" {
  name     = "sql-database"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_database_instance" "instance" {
  name             = "sql-database-instance"
  region           = var.region
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  #deletion_protection  = "true"
  depends_on = [
    google_project_service.project_management_services
  ]
}
