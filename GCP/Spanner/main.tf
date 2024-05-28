resource "google_spanner_instance" "spanner_tf" {
  display_name = "Spanner from tf"
  config = "regional-asia-south1"
  num_nodes = 1
  labels = {
    "env" = "dev"
  }
}

resource "google_spanner_database" "spannerdb_tf" {
  name = "spannerdb_tf" 
  instance = google_spanner_instance.spanner_tf.display_name
}