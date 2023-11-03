resource "aws_iam_user" "iam-user-example" {
    #toset() converts var.user_names list into a set. This is because for_each supports sets and maps only when used on a resource.
    #When for_each loops over this set, it makes each username available in each.value. The username will also be available in each.key, though you typically use each.key only with maps of key-value pairs.
    for_each = toset(var.user_names) 
    
    name = each.value
}

variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}

#iam-user-example its a map of resources, so the keys are the usernames and the values are the config for that resource.
output "all_users" {
  value = aws_iam_user.iam-user-example
}

#To get just the arns from each resource, you need to use value built-in fuction which returns just the value indicated from a map.
output "all_users_arns" {
  value = values(aws_iam_user.iam-user-example)[*].arn
}