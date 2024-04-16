reads = Channel.fromPath('data/ggal/*.fq')

process FOO{
    debug true
    
    input:
    path sample 

    script:
    """
    ls -thl $sample
    """

}

workflow{
    result = FOO( reads.collect() )
}

