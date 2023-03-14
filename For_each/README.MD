# FOR_EACH Expression
## Features
* The for_each expression allows you to loop over lists, sets, and maps to create: multiple copies of an entire resource, multiple copies of an inline block within a resource, or multiple copies of a module.
* Syntax:
    ```
    resource "<PROVIDER>_<RESOURCE>" "<NAME>" {
        for_each = <COLLECTION>

        [CONFIG...]
    }
    ```
    Collection is a set or map to loop over (lists are not supported when using for_each on a resource) and CONFIG consists of one or more arguments that are specific to that resource. Within CONFIG, you can use each.key and each.value to access the key and value of the current item in the COLLECTION.
* Once you create resources using **for_each** you get a **map of resources** rather than an array of resources like with Count. Map of resources allows you to remove items from the middle of a collection safely.
* Another advantage of for_each is it’s ability to create multiple inline blocks within a resource.
* You can use for_each to dynamically generate tag inline blocks for different resources.
* Example
```
dynamic "<VAR_NAME>" {
    for_each = <COLLECTION> #for_each will iterate over <collection> which can be a map or a set
	
    #Content block is what to generate from each iteration
    content {
    	    [CONFIG..]
    }
}

#Example
dynamic "tag" {
    for_each = var.custom_tags
    
	content {
		key = tag.key
	    value = tag.value
        propagate_at_launch = true
	} 
}
```
* When using for_each with a list (toset(list)), the key will be the index and the value will be the item in the list at that index.
* When using for_each with a map, the key and value will be one of the key-value pairs in the map.
