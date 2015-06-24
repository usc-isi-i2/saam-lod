### Script to generate the triple files for SAAM
###
### Execute this script from the main saam-lod directory:
### sh scripts/nt-generator.sh
### sh scripts/nt-generator.sh >run.log 2>&1
###

saam=$(pwd)
karma=/Users/mohsen/Documents/Academic/ISI/_GIT/Web-Karma/karma-offline
modelDir=$saam/models-r2rm
ntDir=$saam/rdf-data-nt
cd $karma

echo $karma
echo $(pwd)

MODELFILES=/$modelDir/*.ttl
for modelFile in $MODELFILES
do
# take action on each file. $f store current file name
#cat $modelFile
filename=$(basename $modelFile)
tablename=${filename%.csv-model*.ttl} #remove the -model*.ttl from the filename. That is assumed to be the tablename.
outputname=${filename%.ttl}
ntFilename=$ntDir/$outputname.nt #would be nice to remove -model, note that we can have multiple models for the same table.

echo "Processing $modelFile file on table $tablename ..."
mvn -e exec:java -Dexec.mainClass="edu.isi.karma.rdf.OfflineRdfGenerator" -Dexec.args=" \
--sourcetype DB --dbtype SQLServer \
--hostname lod.isi.edu --username karma --password k@rm@ \
--portnumber 1433 --dbname smithsonian02042014 --tablename $tablename \
--modelfilepath $modelFile \
--outputfile $ntFilename" -Dexec.classpathScope=compile

# use --topkrows K to select top K rows from the table 

echo "Done with $modelFile file on table $tablename"
done
