
params.size = "100"
params.tag_name = "ZZZ"
params.docker_list = "docker_list"


params.desc = "docker image save"

log.info """\

			Minyoung code
			=======================================

			desc          : ${params.desc}
			
			file size     : ${params.size}

		 """
		 .stripIndent(true)


process DOCKER_LIST {

	tag "T: $tag_name, S: $num"
	publishDir "${params.outdir}/DOCKER", mode: 'copy', overwrite: true


	input:
	val(num)
	val(tag_name)
	val docker_list
	
	output:
	path "$docker_list"

	"""	
	docker images | perl -snle'if(/ago\\s+(\\w+)MB/){ print if \$1 < \$size }' -- -size=${num} | awk '{print \$1":"\$2}' | sed 's/<none>//g' |  perl -nle'\$c=\$_; s/\\//_/g; s/:/_/g; print join "\\t", \$_, \$c' | sed 's/:\$//'  > ${docker_list}

	"""

// docker images > docker_list
// docker images | perl -nle'if(/ago\s+(\w+)MB/){ print if $1<100 }' | awk '{print $1":"$2}' | perl -nle'$c=$_; s/\//_/g; s/:/_/g; print join "\t", $_, $c' > docker_list
}


process DOCKER_SAVE {
	
//	tag "I : $image, V : $version" 
//	tag "$version" 
	publishDir "${params.outdir}/DOCKER_image", mode: 'copy', overwrite: true

	input:
	tuple val(image), val(version)

	output:
	path "${image}.tar"

	"""
	docker save -o ${image}.tar ${version}
	"""

}

workflow {

	// docker_list_ch = DOCKER_LIST( params.size )
	// DOCKER_LIST( params.size ) | view 

	DOCKER_LIST( params.size, params.tag_name, params.docker_list )   
	| view(it -> "file name :  ${it.name}\ncontent\n${it.text}" )
	| set{ docker_list_ch }


    docker_list_ch.splitCsv( header: ['name','version'], sep: '\t' )
//	| view{ row -> "${row.name} -- ${row.version}" }
	| map { row -> [ row.name, row.version ] }
	| set{ img_list_ch }

	img_list_ch
	| view()
	

	DOCKER_SAVE(img_list_ch)


//	docker_list_ch.splitCsv(  sep: '\t' )
//	| view{ row -> "----${row[0]}, ===${row[1]}" }
}
