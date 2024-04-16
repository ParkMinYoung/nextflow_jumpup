
log.info """\
				queue channel : fromList
		 """

println "fromList()"

list = ['hello', 'world']
Channel
		.fromList( list )
		.view()




log.info """\
				queue channel : fromPath 
		 """

Channel
		.fromPath('./data/ggal/**.fq', hidden: true)
		.view()







