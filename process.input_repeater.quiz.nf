
params.reads = "$baseDir/data/ggal/*_1.fq"
params.transcriptome = "$baseDir/data/ggal/transcriptome.fa"
method = ['salmon', 'kallisto']


Channel
    .fromPath( params.reads, checkIfExists: true )
    .set{ read_ch  }


process COMMAND {
    debug true

    input:
    path read
    path transcriptome
    each mode

    output:
    file result

    script:
    """
    echo $mode $transcriptome $read > result
    """
}

workflow {
    
    COMMAND( read_ch, params.transcriptome, method )
        .view{ "To run : ${it.text}" }

}
