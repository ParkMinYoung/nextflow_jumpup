process PYSTUFF {
    script:
    """
    #!/usr/bin/env python

    x = 'Hello'
    y = 'world'

    print ("%s - %s" % (x, y))
    """
}

workflow {
    PYSTUFF()
}

