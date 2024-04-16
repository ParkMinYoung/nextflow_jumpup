
params.data = 'World'

process FOO {
    script:
    """
    echo Hello $params.data
    echo "The current directory is \$PWD"

    """
}

workflow {
    FOO()
}

