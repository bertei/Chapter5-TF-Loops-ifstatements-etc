# COUNT Parameter
## Features
* Terraform doesn’t have for-loops or other traditional procedural logic built into the language, so this syntax won’t work. However, every TF resource has a meta-parameter you can use called count. Count is TF oldest, simplest and most limited iteration construct: **all it does is define how many copies of the resource to create**.
* Note that after you’ve used count on a resource, it becomes an array of resources rather than just one resource. Because aws_iam_user.multiple_users_with_diff_names_array is now an array of iam users, instead of using the standard syntax to read an attribute from that resource (<PROVIDER>_<TYPE>.<NAME>.<ATTRIBUTE>), you must specify which iam user you’re interested in by specifying its index in the array using the same array lookup syntax: (<PROVIDER>_<TYPE>.<NAME>[INDEX].ATTRIBUTE)
* Just as adding count to a resource turns it into an array of resources, adding count to a module turns it into an array of modules.
## Count Limitations
* Although you can use count to loop over an entire resource, **you can’t use count within a resource to loop over inline blocks**.
* When you use count parameter on a resource, that resource becomes an array of resources. TF identifies each resource within the array by its position (index) in that array. **So, when you remove an item from the middle of an array, all the items after it shift back by one.**

