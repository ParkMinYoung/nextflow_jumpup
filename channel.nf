
log.info """\
				queue channel : simple
		 """

ch = Channel.of(1, 3, 5, 7)
ch.view { "value: $it" }


log.info """\
				queue channel : chr
		 """


println "println: 1..23 x y "

Channel
		.of( 1..23, "X", "Y" )
		.view{ "chr: $it" }



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







