resource "google_pubsub_subscription" "sub_tf" {
  name = "sub_tf"
  topic = google_pubsub_topic.topic_tf.name
}

resource "google_pubsub_topic" "topic_tf" {
  name = "topic_tf"
  depends_on = [ google_pubsub_schema.schmea_tf ]
  schema_settings {
    schema = "projects/fifth-winter-415412/schemas/schmea_tf"
    encoding = "JSON"
  }
}

resource "google_pubsub_schema" "schmea_tf" {
  name = "schmea_tf"
  type = "AVRO"
  definition = "{\n  \"type\" : \"record\",\n  \"name\" : \"Avro\",\n  \"fields\" : [\n    {\n      \"name\" : \"name\",\n      \"type\" : \"string\"\n    },\n    {\n      \"name\" : \"age\",\n      \"type\" : \"int\"\n    }\n  ]\n}\n"
}