// 8.1 Printing values

print("Hello, World!")

// The only difference between the two is that the println method implicitly appends a new line character to the printed string.


println("Hello, World!")


// Parentheses for function invocations are optional. Therefore, the following syntax is also valid:

println "Hello, World!"



// 8.2 Comments


// comment a single line

/*
      a comment spanning
      multiple lines
*/





// 8.3 Variables

x = 1
println x

x = new java.util.Date()
println x

x = 3.1499393
println x 

x = false
println x 

x = "Hi"
println x 

// Local variables are defined using the def keyword:
// The def should be always used when defining variables local to a function or a closure.
def x = 'foo'




// 8.4 Lists

list = [10, 20, 30, 40]

// You can access a given item in the list with square-bracket notation (indexes start at 0) or using the get method:
println list[0]
println list.get(0)


// In order to get the length of a list you can use the size method:
// list 의 요소의 수를 리턴
println list.size()


// if 와 비슷하게 list[0] 이 10 인지를 평가하고, true라면 아무것도 print 하지 않고, false라면 AssertionError messeage 출력
assert list[0] == 10
// ERROR
// assert list[0] == 20


list = [0, 1, 2]
assert list[-1] == 2
assert list[-1..0] == list.reverse()

assert [1, 2, 3] << 1 == [1, 2, 3, 1]                        // push
assert [1, 2, 3] + [1] == [1, 2, 3, 1]                       // push   
assert [1, 2, 3, 1] - [1] == [2, 3]                          // ?
assert [1, 2, 3] * 2 == [1, 2, 3, 1, 2, 3]
assert [1, [2, 3]].flatten() == [1, 2, 3]
assert [1, 2, 3].reverse() == [3, 2, 1]
assert [1, 2, 3].collect { it + 3 } == [4, 5, 6]
assert [1, 2, 3, 1].unique().size() == 3
assert [1, 2, 3, 1].count(1) == 2
assert [1, 2, 3, 4].min() == 1
assert [1, 2, 3, 4].max() == 4
assert [1, 2, 3, 4].sum() == 10
assert [4, 2, 1, 3].sort() == [1, 2, 3, 4]
assert [4, 2, 1, 3].find { it % 2 == 0 } == 4
assert [4, 2, 1, 3].findAll { it % 2 == 0 } == [4, 2]























