#!/bin/bash

### Script to generate the N3 files for SAAM
### 
### Execute this script from the main saam-lod directory: 
###   sh scripts/generate-all-n3.sh
###   sh scripts/generate-all-n3.sh >run.log 2>&1
###
### It assumes that Karma has the same parent folder as saam-lod, if not, change the karma variable below
### Copy the ontologies in saam-lod\preloaded-ontologies-crm folder to the karma\preloaded-ontologies folder
###

saam=$(pwd)
karma=$saam/../Web-Karma/karma-offline
modelDir=$saam/crm-models/final
n3Dir=$saam/n3
cd $karma


MODELFILES=/$modelDir/*.ttl
for modelFile in $MODELFILES
do
  # take action on each file. $f store current file name
  #cat $modelFile
  filename=$(basename $modelFile)
  tablename=${filename%-model*.ttl}   #remove the -model*.ttl from the filename. That is assumed to be the tablename.
  outputname=${filename%.ttl}
  n3Filename=$n3Dir/$outputname.n3    #would be nice to remove -model, note that we can have multiple models for the same table.

  echo "Processing $modelFile file on table $tablename ..."
  mvn exec:java -Dexec.mainClass="edu.isi.karma.rdf.OfflineRdfGenerator" -Dexec.args=" \
--sourcetype DB --dbtype SQLServer \
--hostname $1 --username $2 --password $3 \
--portnumber $4 --dbname $5 --tablename $tablename \
--modelfilepath $modelFile \
--outputfile $n3Filename" -Dexec.classpathScope=compile

  echo "Done with $modelFile file on table $tablename"
done

