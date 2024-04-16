params.reads = "$baseDir/data/ggal/*_1.fq"
params.transcriptome = "$baseDir/data/ggal/transcriptome.fa"

Channel
    .fromPath( params.reads )
    .set{ read_ch }

Channel
    .fromPath( params.transcriptome )
    .set{ trans_ch }


process EXECUTE {

    input:
    path sample
    path transcriptome


    output:
    path result

    script:
    """
    echo $sample run using $transcriptome > result
    """

}

workflow {

    step1_ch = EXECUTE( read_ch, params.transcriptome )
    step1_ch.view()

}
