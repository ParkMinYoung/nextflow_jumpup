params.reads = "$projectDir/data/ggal/gut_{1,2}.fq"
params.transcriptome_file = "$projectDir/data/ggal/transcriptome.fa"
params.multiqc = "$projectDir/multiqc"


params.outdir = "$projectDir/results"

log.info """\
		Minyoung Sample output
		============================================

		transcriptome : ${params.transcriptome_file}
		reads         : ${params.reads}
		multiqc       : ${params.multiqc}
		outdir        : ${params.outdir}
		"""
		.stripIndent(true)



// println "reads  : $params.reads"
// println "outdir : $params.outdir"


process INDEX {
	
	cpus 2

	input:
	path transcriptome

	output:
	path 'salmon_index'

	script:
	"""
	salmon index --threads $task.cpus -t $transcriptome -i salmon_index
	"""

}


workflow {
	index_ch = INDEX( params.transcriptome_file )
	index_ch.view { it }

}
