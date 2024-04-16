import groovy.json.JsonSlurper

def parseJsonFile(json_file) {
    def f = file('data/meta/regions.json')
    def records = new JsonSlurper().parse(f)
    return records
}
