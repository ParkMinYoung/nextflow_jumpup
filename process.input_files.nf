reads = Channel.fromPath('data/ggal/*.fq')

process FOO{
    debug true
    
    input:
    path 'sample.fastq'

    script:
    """
    ls -thl sample.fastq 
    """

}

workflow{
    result = FOO(reads)

}

