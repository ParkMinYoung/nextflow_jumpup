println "if statement"

x = 1

if( x > 10 )
	println 'Hello'

if_statement = """

x = 1

if( x > 10 )
	println 'Hello'

"""

println if_statement




list = [1, 2, 3]
if (list != null && list.size() > 0) {
	println list
}
else {
	println 'The list is empty'
}


if_statement2 = """

list = [1, 2, 3]
if (list != null && list.size() > 0) {
	println list
}
else {
	println 'The list is empty'
}

"""

println if_statement2



// Can be written as:

if (list)
	println list
else
	println "The list is empty"



println list ? list : 'The list is empty'

println list ?: 'The list is empty'





println 'for statement'

for (int i = 0; i < 3 ; i++){

	println("Hello World $i")
}

list = ['a', 'b', 'c']

for (String elem : list){
	println elem
}

