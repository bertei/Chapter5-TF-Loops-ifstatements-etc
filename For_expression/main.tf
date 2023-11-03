variable "names" {
  type = list(string)
  default = [ "asd", "qwe" ]
}

resource "aws_iam_user" "test" {
  for_each = toset(var.names)
  name = each.value
}

#Loops over var.names(list), and transforms each name to uppercase
output "upper_names" {
  value = [for name in var.names : upper(name)]
}

variable "users_lovers" {
  type = map(string)
  default = {
    one = "two"
    two = "three"
  }
}

#Loops over a map and returns a list
output "user_lovers" {
  value = [for key, value in var.users_lovers : "${key} loves ${value}"]
}

#Loop over a list and return a map
output "loop_over_list_return_map" {
  value = {for index, name in var.names : name => index}
}

#locals {
#  names_map = {for name in var.names : name => count.index}
#}
#
##Loop over a list and return a map
#output "loop_over_list_return_map" {
#  value = local.names_map
#}
