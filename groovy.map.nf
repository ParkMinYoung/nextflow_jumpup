// 8.5 Maps

map = [a: 0, b: 1, c: 2]


assert map['a']     == 0 
assert map.b        == 1
assert map.get('c') == 2


// To add data or to modify a map, the syntax is similar to adding values to a list:

map['a'] = 'x'
map.b = 'y'
map.put('c', 'z')
assert map == [a: 'x', b: 'y', c: 'z']


// 8.6 String interpolation

foxtype = 'quick'
foxcolor = ['b','r','o','w','n']
println "The $foxtype ${foxcolor.join()} fox"

x = 'Hello'
println '$x + $y'


// slashy strings and are useful for defining regular expressions and patterns, as there is no need to escape backslashes.
x = /tic\tac\toe/
y = 'tic\tac\toe'

println x  // tic\tac\toe
println y  // tic    ac    oe


// Multi-line strings

// multiple lines can be defined by delimiting it with triple single or double quotes: """ or '''

text = """
    Hello there James.
    How are you today?
	"""

println text


// Finally, multi-line strings can also be defined with slashy strings. For example:

text = /
    This is a multi-line
    slashy string!
    It's cool, isn't it?!
	/
println text

// Like before, multi-line strings inside double quotes and slash characters support variable interpolation, while single-quoted multi-line strings do not.


