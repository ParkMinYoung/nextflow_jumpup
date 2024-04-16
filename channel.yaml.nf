import org.yaml.snakeyaml.Yaml

def f = file('data/meta/regions.yml')
def records = new Yaml().load(f)

for ( def entry : records ){
		log.info "$entry.patient_id -- $entry.feature"
}
