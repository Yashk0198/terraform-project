data "local_file" "read_data" {
    filename = "sample4.txt"
  
}

output "o/p" {
    value = data.local_file.read_data.content
}

// data resource is used for reading the data from local file.