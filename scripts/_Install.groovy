import org.apache.commons.io.FileUtils

//
// This script is executed by Grails after plugin was installed to project.
// This script is a Gant script so you can use all special variables provided
// by Gant (such as 'baseDir' which points on project base dir). You can
// use 'ant' to access a global instance of AntBuilder
//
// For example you can create directory under project tree:
//
// ant.mkdir(dir:"${basedir}/grails-app/jobs")
//
// ${pluginBasedir} is available ONLY in this script
// use ${algosBasedir} instead

/*
 * Main script to setup algos on installation
 */

String source
String dest

//--utilizza le special variables provided by Gant
source = "${pluginBasedir}"
dest = "${basedir}"

source = source + "/"
dest = dest + "/"

//--directory del plugin
String sourceDir = "${source}grails-app/it/algos/algos/"

//--directory dell'applicazione
String appDir = "grails-app/"
String jobsDir = "${appDir}jobs/"
String viewsDir = "${appDir}views/"
String templatesDir = "src/templates/"
String artifactsDir = "${templatesDir}artifacts/"
String scaffoldingDir = "${templatesDir}scaffolding/"
String assetsDir = "${appDir}assets/"
String stylesheetsDir = "${assetsDir}stylesheets/"


print('------------')
print('Algos - installazione plugin')
print('------------')

// The GroovyScriptEngine needs to know the root directories of your code
def dirRoot = "${pluginBasedir}/scripts/"
String[] roots = [dirRoot]

def engine = new GroovyScriptEngine(roots)

// Load the class and create an instance
def algosTag = engine.loadScriptByName("AlgosTag.groovy")

// Load the class and create an instance
def algosType = engine.loadScriptByName("AlgosType.groovy")

// Load the class and create an instance
def algosBaseClass = engine.loadScriptByName("AlgosBase.groovy")
def ab = algosBaseClass.newInstance()
// inietta la property nel file
ab.sourceDir = sourceDir

// copy readme into project
sourceFile = "${pluginBasedir}/README"
targetFile = "${basedir}/README-Lib"
ant.copy(file: sourceFile, tofile: targetFile, overwrite: true)
ant.delete(file: sourceFile)

print('------------')
print('Algos - creato (o sovrascritto) README-Algos')
print('------------')

//--copia tutti i files dalla della directory indicata
//--sovrascrive file main
ab.copyFile(source, dest, "${stylesheetsDir}main.css")

//--sposta file RefreshJob
ab.moveFile(source, dest, "${jobsDir}RefreshJob.groovy")

//--sovrascrive file index
ab.copyFile(source, dest, "${viewsDir}index.gsp")

//--sovrascrive cartella scaffolding
ab.dirAlways(source, dest, scaffoldingDir)

print('------------')
print('Algos - fine plugin')
print('------------')
