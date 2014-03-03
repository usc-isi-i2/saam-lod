#!/bin/bash

### Script to post the Ontology files to the triple store
### 
### Execute this script from the main saam-lod directory: sh scripts/load-ontologies.sh
###

saam=$(pwd)
owlDir=$saam/preloaded-ontologies-crm

sesameEndpoint=http://lod.isi.edu/openrdf-sesame/repositories/saam_openrdf/statements
#sesameEndpoint=http://localhost:8080/openrdf-sesame/repositories/saam_openrdf/statements

sesameUploadEndpoint=$sesameEndpoint?baseURI='<http://collection.americanart.si.edu/id/>'

#load the ontology files
OWLFILES=/$owlDir/*.owl
for owlFile in $OWLFILES
do
  echo "Loading $owlFile file..."
  curl -X POST -H "Content-Type:application/rdf+xml" -T $owlFile $sesameUploadEndpoint
done
