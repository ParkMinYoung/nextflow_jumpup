params.output = 'my-results'
params.protein = 'data/prots/*.tfa'
protein_ch = Channel.fromPath( params.protein )

process BLASTSEQ {

	publishDir "$params.output/bam_files", mode: "copy"

	input:
	path fasta

	output:
	path ('*.txt')

	script:
	"""
	echo blastp $fasta > ${fasta}_result.txt
	"""

}


workflow {

	result = BLASTSEQ( protein_ch )
//	result.view()
	result
//		.view{ "path: $it => File: ${it.name} => ${it.text}" }
		.view{ "path: $it => File: ${it.name} => " + it.text }

}
