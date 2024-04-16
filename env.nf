process myTask {
    output:
    env FOO

    script:
    '''
    FOO=$(ls -la)
    '''
}

workflow {
    myTask | view { "directory contents: $it" }
}
