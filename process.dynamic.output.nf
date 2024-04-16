species = ['dog','cat','sloth']
sequence =  ['AGATAG', 'ATGCTCT', 'ATCCCAA']


Channel
    .fromList( species )
    .set{ species_ch }

process ALIGN {

    input:
    val x
    val seq

    output:
    path "${x}.aln"

    script:
    """
    echo align -in $seq > ${x}.aln
    """
}

workflow {
    ALIGN ( species_ch, sequence ) 
        .view{ "name : ${it.name} -> content : ${it.text}" }
//        .view()
}
