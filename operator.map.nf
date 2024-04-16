Channel
	.of('hello', 'world')
	.map { it -> it.reverse() }
	.view()


Channel
	.of('hello', 'world')
	.map { word -> [word, word.size()] }
	.view { word, len -> "$word contains $len letters" }



Channel
    .fromPath('data/ggal/*.fq')
	.map { file -> [file.name, file] }
	.view { name, file -> "> $name : " + file }
