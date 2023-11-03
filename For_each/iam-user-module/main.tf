resource "aws_iam_user" "example" {
  name = var.user_name
}

#output "user_arn" {
#  value = aws_iam_user.example.arn
#}