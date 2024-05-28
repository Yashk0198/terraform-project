#create bucket
#upload zip
#deploy function
#policy binding

resource "google_storage_bucket" "fun_bucket_tf" {
  name = "funcloudtfbucketusnew"
  location =  "us"
}

resource "google_storage_bucket_object" "fun_bucket_tf_object" {
    name = "cloudfncode.zip"
    bucket = google_storage_bucket.fun_bucket_tf.name
    source = "cloudfncode.zip"
}

resource "google_cloudfunctions_function" "func_from_tf_cloud" {
  name = "funcfromtfcloudnodenew"
  runtime = "nodejs20"

  available_memory_mb = 128
  source_archive_bucket = google_storage_bucket.fun_bucket_tf.name
  source_archive_object = google_storage_bucket_object.fun_bucket_tf_object.name

  trigger_http = true
  entry_point = "helloHttpfromtf"
  
}

resource "google_cloudfunctions_function_iam_member" "allowaccess" {
  cloud_function = google_cloudfunctions_function.func_from_tf_cloud.name
  role = "roles/cloudfunctions.invoker" 
  member = "allUsers"

  region = google_cloudfunctions_function.func_from_tf_cloud.region 
}