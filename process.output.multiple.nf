


process SPLITLETTERS {

    output:
    path 'chunk_*'

    script:
    """
    echo -n hola | split -b 1 - chunk_
    """

}


workflow {
    SPLITLETTERS()
        .flatten()
        .view{ "$it.name --> $it.text" }
}

//        .flatMap()
