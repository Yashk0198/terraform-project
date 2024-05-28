resource "google_storage_bucket" "GCS" {
    name = "terraform-xyz"
    location = "asia"
    storage_class = "STANDARD"

    labels = {
      "env" = "prod"
    }

    uniform_bucket_level_access = true

    lifecycle_rule {
      condition {
        age = 5      
      }
      action {
        type = "SetStorageClass"
        storage_class = "COLDLINE"         
      }
    }

    retention_policy {
      is_locked = true
      retention_period = 864000
    }
}

resource "google_storage_bucket_object" "picture" {
  bucket = google_storage_bucket.GCS.name
  name = "picture_logo"
  source = "nginx.png" 
}