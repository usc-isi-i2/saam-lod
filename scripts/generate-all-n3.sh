#!/bin/bash

### Script to generate the N3 files for SAAM
### 
### Execute this script from the main saam-lod directory: sh scripts/generate-all-n3.sh
### It assumes that Karma has the same parent folder as saam-lod, if not, change the karma variable below
### Copy the ontologies in saam-lod\preloaded-ontologies-crm folder to the karma\preloaded-ontologies folder
###

saam=$(pwd)
karma=$saam/../Web-Karma/
modelDir=$saam/crm-models/blue
n3Dir=$saam/n3
cd $karma


MODELFILES=/$modelDir/*.ttl
for modelFile in $MODELFILES
do
  echo "Processing $modelFile file on table $tablename ..."
  # take action on each file. $f store current file name
  #cat $modelFile
  filename=$(basename $modelFile)
  tablename=${filename%-model.ttl}   #remove the -model..ttl from the filename. That is assumed to be the tablename.
  n3Filename=$n3Dir/$tablename.n3

  mvn exec:java -Dexec.mainClass="edu.isi.karma.rdf.OfflineRdfGenerator" -Dexec.args=" \
--sourcetype DB --dbtype SQLServer \
--hostname lod.isi.edu --username sa --password isi4676 \
--portnumber 1433 --dbname smithsonian02042014 --tablename $tablename \
--modelfilepath $modelFile \
--outputfile $n3Filename" -Dexec.classpathScope=compile

  echo "Done with $modelFile file on table $tablename"
done
