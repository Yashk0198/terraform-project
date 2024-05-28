 resource "google_cloud_run_service" "run-app-from-tf" {
  name = "run-app-from-tf"
  location = "us-central1"

  template {
    spec {
      containers {
        # image = "us-docker.pkg.dev/cloudrun/container/hello:1.0"
        image = "us-docker.pkg.dev/cloudrun/container/hello:2.0"
      }
    }
  }

  traffic {
    revision_name = "run-app-from-tf-abc"
    percent = 50
  }

   traffic {
    revision_name = "run-app-from-tf-bcd"
    percent = 50
  } 

 }


 resource "google_cloud_run_service_iam_policy" "pub_access" {
  service = google_cloud_run_service.run-app-from-tf.name
  location = google_cloud_run_service.run-app-from-tf.location
  policy_data = data.google_iam_policy.pub_1.policy_data
 }

 data "google_iam_policy" "pub_1" {
  binding {
    role = "roles/run.invoker"
    members = [ "allUsers" ]
  }
   
 }
