

log.info """\
				queue channel :splitText 
		 """

Channel
		.fromPath('data/meta/random.txt')
		.splitText()
		.view{ "splitText : $it " }

// The subscribe operator permits execution of user defined functions each time a new value is emitted by the source channel.

Channel
		.fromPath('data/meta/random.txt', checkIfExists: true)
		.splitText( by: 2 )
		.subscribe {
				print "--- start of the chunk ---\n"
				print it;
				print "--- end of the chunk ---\n"
				}



Channel
		.fromPath('data/meta/random.txt', checkIfExists: true)
		.splitText(by: 10){ it.toUpperCase() }
		.view()






count = 0

Channel
		.fromPath('data/meta/random.txt')
		.splitText()
		.view { "${count++}: ${it.toUpperCase().trim()}" }



// Finally, you can also use the operator on plain files (outside of the channel context):

def f = file('data/meta/random.txt')
def lines = f.splitText()
def count = 0

for ( String row : lines ){
		log.info "plain text : ${count++} ${row.toUpperCase()}"
}

