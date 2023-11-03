# Loops with FOR expressions
* Basic syntax of a **for** expresion is -> [for <ITEM> in <LIST> : <OUTPUT>]
* Where LIST is a list to loop over, ITEM is the local variable name to assign to each item in LIST, and OUTPUT is an expression that transforms ITEM in some way.
* Also allows you to loop over a map -> [for key, value in map : output]
* Loop over a list and output a map -> {for <ITEM> in <LIST> : <OUTPUT_KEY> => <OUTPUT_VALUE>}
* Loop over a map and output a map -> {for <KEY>, <VALUE> in <MAP> : <OUTPUT_KEY> => <OUTPUT_VALUE>}