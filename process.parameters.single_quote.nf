
params.data = 'World'

process FOO {
    shell:
    ''' 
    X='Bomjour'
    echo Hello !{params.data}
    echo "The current directory is $PWD"
    echo $X

    '''
}

workflow {
    FOO()
}

