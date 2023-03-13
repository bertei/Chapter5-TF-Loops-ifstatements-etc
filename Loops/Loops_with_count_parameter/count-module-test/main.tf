provider "aws" {}

module "iam-module" {
    source = "../count-module-explanation"

    count = length(var.user_names)
    user_name = var.user_names[count.index]
}

variable "user_names" {
    type = list(string)
    default = ["test1", "test2", "test3"]
}