### Script to the N3 files for SAAM
### 
### Execute this script from the main saam-lod directory: sh scripts/load-rdf.sh
###

saam="/Users/szekely/github/saam-lod"
karma="/Users/szekely/Web-Karma"

cd $karma

mvn exec:java -Dexec.mainClass="edu.isi.karma.rdf.OfflineRdfGenerator" -Dexec.args=" \
--sourcetype DB --dbtype SQLServer \
--hostname lod.isi.edu --username sa --password isi4676 \
--portnumber 1433 --dbname smithsonian02042014 --tablename cbev2.WebConstituents \
--modelfilepath $saam/crm-models/WSP7WS1-cbev2.WebConstituents-sample.csv-model.ttl \
--outputfile $saam/n3/xxx.n3" -Dexec.classpathScope=compile
