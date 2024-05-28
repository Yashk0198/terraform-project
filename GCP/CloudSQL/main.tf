resource "google_sql_database_instance" "mysql_from_tf" {
  database_version = "MYSQL_5_6"
  name = "mysql_from_tf"
  deletion_protection = false
  region = "us-central1" //by default it is true means no one delete 

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "sql_user" {
  name = "yash"
  password = "yash@123"
  instance = google_sql_database_instance.mysql_from_tf.name
}