provider "aws" {
  region = "us-east-1"
}

#Count = all it does is define how many copies of the resource to create
# It will create 3 users with the same name and this will fail.
#resource "aws_iam_user" "test" {
#    count   = 3
#    name    = "test"
#}

#As each iam user name must be unique, if you had access to a standard for-loop you might use the index in the for-loop, i, to give each user a unique name.
#To accomplish the same thing in TF, you can use count.index to get the index of each iteration in the loop
#Output = 3 users ("neo.0", "neo.1", "neo.2")
#resource "aws_iam_user" "test" {
#    count   = 3
#    name    = "test.${count.index}"
#}

#Of course, a username like "neo.0" isn’t particularly usable.
variable "user_names" {
    description = "Crate iam users with these names."
    type = list(string)
    default = ["test1", "test2", "test3"]
}

#Now we should do Array lookup syntax -> ARRAY[<INDEX>]
#Lenght function -> lenght(<ARRAY>) = returns the number of items in the given array.
#Put both together
resource "aws_iam_user" "test" {
    count   = length(var.user_names) #3
    name    = var.user_names[count.index]
}

#After you've used count on a resource, it becomes an array of resources. To read a resource from an array of resources
#The syntax it's = <PROVIDER_TYPE>.NAME[INDEX].ATTRIBUTE -> aws.test[0].arn OR aws.test[*].arn (returns all user arn's)

output "first_arn" {
    value = aws_iam_user.test[0].arn
    description = "The arn of the first user"
}

output "all_arn" {
    value = aws_iam_user.test[*].arn
    description = "The arn of all users"
}