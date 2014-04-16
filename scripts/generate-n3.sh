### Script to the N3 files for SAAM
### 
### Execute this script from the main saam-lod directory: sh scripts/load-rdf.sh
###


tablename='cbev2.WebConDates'

saam=$(pwd)
karma=$saam/../Web-Karma/karma-offline
modelDir=$saam/crm-models/final
n3Dir=$saam/n3
cd $karma

outputname=$tablename
n3Filename=$n3Dir/$outputname.n3    #would be nice to remove -model, note that we can have multiple models for the same table.
modelFile=$modelDir/$tablename-model.ttl

echo "Processing $modelFile file on table $tablename ..."
mvn exec:java -Dexec.mainClass="edu.isi.karma.rdf.OfflineRdfGenerator" -Dexec.args=" \
--sourcetype DB --dbtype SQLServer \
--hostname lod.isi.edu --username sa --password isi4676 \
--portnumber 1433 --dbname smithsonian02042014 --tablename $tablename \
--modelfilepath $modelFile \
--outputfile $n3Filename" -Dexec.classpathScope=compile

echo "Done with $modelFile file on table $tablename, output: $n3Filename"


