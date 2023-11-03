locals {
  inputs = yamldecode(file("inputs.yaml"))

  #user_names = { for user in var.user_names : user.name => user }
}

module "users" {
  source = "../iam-user-module"

  #for_each = toset(inputs.user_names)
  #for_each = local.inputs.user_names
  #for_each = local.user_names
  user_name = local.inputs.name
}