


// anonymous function or code block can be passed asn an argument to a function

squre = { it * it }


assert squre.call(5) == 25
assert squre(9) == 81



// x == y 

x = [1, 2, 3, 4].collect(squre)

println x


y = [1, 2, 3, 4].flatten(squre)

println y



printMap = { a, b -> println "$a with value $b" }
values = ["Yue": "Wu", "Mark": "Williams", "Sudha": "Kumari"]
values.each( printMap )




result = 0 // Defines a global variable.
values = ["China": 1, "India": 2, "USA": 3] // Defines map object
values.keySet().each { result += values[it] } // Invokes the each method passing the closure object which modifies the result variable.

println result

// 6 



