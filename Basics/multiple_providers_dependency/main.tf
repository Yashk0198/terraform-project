
// implicit dependency means whether you write code above but first random_string will execute
//after that local file will generate
# resource local_file sample_res {
#   content = "Content is taking from random string: ${random_string.rand_str.id}"
#   filename = "sample.txt"
# }


// explicit dependency
resource local_file sample_res {
  content = "Content is taking from random string: ${random_string.rand_str.id}"
  filename = "sample.txt"
  depends_on = [ random_string.rand_str ]
}

resource "random_string" "rand_str" {
  length =  5 
}