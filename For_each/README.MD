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
