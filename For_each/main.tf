resource "aws_iam_user" "iam-user-example" {
    #toset() converts var.user_names list into a set. This is because for_each supports sets and maps only when used on a resource.
    #When for_each loops over this set, it makes each username available in each.value. The username will also be available in each.key, though you typically use each.kety only with maps of key-value pairs.
    for_each = toset(var.user_names) 
    
    name = each.value
}

variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}

output "all_users" {
  value = aws_iam_user.iam-user-example
}