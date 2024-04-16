

params.dbtype = 'nr'
params.protein = 'data/prots/*.tfa'

protein_ch = Channel.fromPath(params.protein)



process FIND {
	debug true

	input:
	path fasta
	val type

	when:
	fasta.name =~ /^BB11.*/ && type == 'nr'

	script:
	"""
	echo blastp -query $fasta -db $type
	"""

}

workflow {

	result = FIND( protein_ch, params.dbtype )
}
