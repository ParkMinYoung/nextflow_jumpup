seuqences = Channel.fromPath( 'data/prots/*.tfa' )
methods = ['regular', 'espresso', 'psicoffee']


process ALIGNSEQUENCES {
    debug true

    input:
    path seq
    each mode

    output:
    path result

    script:
    """
    echo t_coffee -in $seq -mode $mode > result 
    """

}

workflow{

    align_ch = ALIGNSEQUENCES( seuqences, methods )
    align_ch
         .view{ "path: $it => File: ${it.name} => ${it.text}" }
        //.view{ it } 

}

