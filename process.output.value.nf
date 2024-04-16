
method = ['prot','dna','rna']

process FOO {

    input:
    val x

    output:
    val x

    script:
    """
    echo $x > file
    """
}

workflow {

    FOO( Channel.of( method ) )
        .view { "Received : $it " }

}
