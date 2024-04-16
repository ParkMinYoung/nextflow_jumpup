

process RANDOMNUM {
    
    output:
    path 'results' 

    script:
    """
    echo \$RANDOM > results
    """
}


workflow {

    RANDOMNUM ()
        .view{ "received value : $it, " + it.text }
}
