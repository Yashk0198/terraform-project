resource local_file sample_res {
  content = var.content1["name"]
  filename = var.filename1
}
