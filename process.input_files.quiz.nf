params.reads = 'data/ggal/*_1.fq'

Channel
    .fromPath( params.reads )
    .set { read_ch }

process CONCATNATE{
    tag "Concat all files"

    input:
    path '*' 

    output:
    path 'top_10_lines'

    script:
    """
    ls * | sort | xargs cat  > concat.txt
    head -n 10 concat.txt > top_10_lines
    """

}


workflow{

    concat_ch = CONCATNATE( read_ch.collect() )
    concat_ch.view()

}

// ls * | sort | xargs cat > concat.txt
