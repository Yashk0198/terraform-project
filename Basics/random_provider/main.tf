resource "random_integer" "rint" {
  max = 50
  min = 20 
}

output "randomno" {
  value = random_integer.rint.result 
}