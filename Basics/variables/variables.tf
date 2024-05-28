variable "filename1" {
  type = string
  default = "sample"
}

# variable "content1" {
#     type = string
#     default = "content is coming from variable"  
# }

# variable "content1" {
#     type = list(string)
#     default = ["green","red", "blue"]  
# }

# variable "content1" {
#     type = tuple([ bool, string, number ])
#     default = [true,"red", 20]  
# }

variable "content1" {
    type = map
    default = {name = "Amkit", age= 32}
}