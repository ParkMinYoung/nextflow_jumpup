params.greeting = 'Hello world'
greeting_ch = Channel.of(params.greeting)


include { SPLITLETTERS   } from './modules.nf'
include { CONVERTTOUPPER } from './modules.nf'


workflow { 
	letters_ch = SPLITLETTERS(greeting_ch)
	result_ch  = CONVERTTOUPPER(letters_ch.flatten())
	// result_ch  = CONVERTTOUPPER(letters_ch.flatten())
	result_ch.view{ it }

}
