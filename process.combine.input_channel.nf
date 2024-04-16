ch1 = Channel.of(1, 2, 3)
ch2 = Channel.of('a','b','c')


process FOO {

    debug true

    input:
    val x
    val y

    script:
    """
    echo $x and $y
    """

}

workflow {

    FOO(ch1, ch2)

}
