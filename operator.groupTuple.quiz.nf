Channel
	.fromPath('data/meta/*')
	.map { file -> [ file.baseName, file ] }
	//.map { file -> tuple( file.baseName, file ) }
	.groupTuple()
	.view{  baseName, file -> "> $baseName : $file" }
