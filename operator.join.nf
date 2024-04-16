left = Channel.of(['X', 1], ['Y', 2], ['Z', 3], ['P', 7])
right = Channel.of(['Z', 6], ['Y', 5], ['X', 4])

left
	.join(right)
	.view()

	
left
	.join(right)
	.view{ W1, W2, W3 -> " W1 : $W1, W2 : $W2, W3 : " + W3 }
