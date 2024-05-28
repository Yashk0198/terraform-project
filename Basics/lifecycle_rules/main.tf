resource "random_integer" integer{
  min = 20
  max = 100

    lifecycle {
      #create_before_destroy = true
      #prevent_destroy = true
      #ignore_changes = [ min ]
    }
  
}