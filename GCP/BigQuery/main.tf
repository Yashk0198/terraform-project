resource "google_bigquery_dataset" "bg_dataset" {
  dataset_id = "bg_dataset"
}

resource "google_bigquery_table" "bg_table_tf" {
  table_id = "bg_table_tf"
  dataset_id = google_bigquery_dataset.bg_dataset.dataset_id  
}