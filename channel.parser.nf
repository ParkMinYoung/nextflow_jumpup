include { parseJsonFile } from './modules/parsers.nf'

process FOO {
    input:
    tuple val(patient_id), val(feature)

    output:
    stdout

    script:
    """
    echo $patient_id has $feature as feature
    """
}

workflow {
    Channel
        .fromPath('data/meta/regions*.json')
        | flatMap { parseJsonFile(it) }
        | map { record -> [record.patient_id, record.feature] }
        | unique
        | FOO
        | view
}
