

params.reads = "$projectDir/data/ggal/gut_{1,2}.fq"
params.transcriptome_file = "$projectDir/data/ggal/transcriptome.fa"
params.multiqc = "$projectDir/multiqc"
params.outdir = "results"


log.info """\
		R N A S E Q - N F    P I P E L I N E
		====================================

		transcriptome : ${params.transcriptome_file}
        reads         : ${params.reads}
        outdir        : ${params.outdir}
        multiqc       : ${params.multiqc}
		"""
		.stripIndent()


process INDEX {

		cpus 2
		tag 'salmon_index'


		input:
		path transcriptome

		output:
		path 'salmon_index'

		script:
		"""
		salmon index --threads $task.cpus -t $transcriptome -i salmon_index
		"""
}

process QUANTIFICATION {

		tag "salmon on $sample_id"
		cpus 2
		// publishDir params.outdir, mode: 'copy'
		publishDir "$params.outdir/QUANTIFICATION", mode: 'copy'
		
		input:
		path salmon_index
		tuple val(sample_id), path(reads)

		output:
		path "$sample_id"

		script:
		"""
		salmon quant --threads $task.cpus --libType=U -i $salmon_index -1 ${reads[0]} -2 ${reads[1]} -o $sample_id
		"""
}


process FASTQC {

		tag "FASTQC on $sample_id"
		// publishDir params.outdir, mode: 'copy'
		publishDir "$params.outdir/FASTQC", mode: 'copy'

		input:
		tuple val(sample_id), path(reads)

		output:
		path "fastqc_${sample_id}_logs"

		script:
		"""
		mkdir fastqc_${sample_id}_logs
		fastqc -o fastqc_${sample_id}_logs -f fastq -q ${reads}
		"""

}


process MULTIQC {

		tag "multiqc"
		// publishDir params.multiqc, mode: 'copy'
		publishDir "$params.outdir/MultiQC", mode: 'copy'

		input:
		path '*'

		output:
		path 'multiqc_report.html'

		script:
		"""
		multiqc .
		"""

}


workflow {

		Channel
				.fromFilePairs( params.reads, checkIfExists: true)
				.set{ read_pairs_ch }

		index_ch = INDEX( params.transcriptome_file )
		quant_ch = QUANTIFICATION( index_ch, read_pairs_ch )
		fastqc_ch = FASTQC( read_pairs_ch )

		MULTIQC( quant_ch.mix(fastqc_ch).collect() )

}

workflow.onComplete {
		log.info( workflow.success ? "\nDone!" : "Oops .. something went wrong" )
}
