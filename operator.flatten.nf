foo = [1, 2, 3]
bar = [4, 5, 6]

Channel
	.of( foo )
	.view()

	
Channel
	.of( foo, bar )
	.flatten()
	.view()
