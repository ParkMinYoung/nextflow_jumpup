Channel
		.fromPath('data/meta/patients_1.csv')
		.splitCsv()
		// row is a list object
		.view { row -> "${row[0]},${row[3]}" }

Channel
		.fromPath('data/meta/patients_1.csv')
		.splitCsv()
		// row is a list object
		.view { row -> "${row}" }


Channel
		.fromPath('data/meta/patients_1.csv')
		.splitCsv(header: true)
		// row is a list object
		.view { row -> "${row.patient_id}, [using column name] ,${row.num_samples}" }

Channel
		.fromPath('data/meta/regions.tsv', checkIfExists: true)
		.splitCsv(sep: '\t')
		.view()


Channel
		.fromPath('data/meta/regions.tsv', checkIfExists: true)
		.splitCsv(sep: '\t', header: true)
		.view{ row -> "${row.patient_id}" }
