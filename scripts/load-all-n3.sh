#!/bin/bash

### Script to post the N3 files to the triple store
### 
### Execute this script from the main saam-lod directory: sh scripts/load-all-n3.sh
###

saam=$(pwd)
n3Dir=$saam/n3
sameAsn3Dir=$n3Dir/n3-seeAlso

sesameEndpoint=http://lod.isi.edu/openrdf-sesame/repositories/saam_openrdf/statements
#sesameEndpoint=http://localhost:8080/openrdf-sesame/repositories/saam_openrdf/statements

sesameUploadEndpoint=$sesameEndpoint?baseURI='<http://collection.americanart.si.edu/id/>'


# Uncomment to clear the repo 
curl -X DELETE $sesameEndpoint

N3FILES=/$n3Dir/*.n3
#load all n3 files in the n3 directory
for n3File in $N3FILES
do
  echo "Processing $n3File file..."
  curl -X POST -H "Content-Type:text/rdf+n3" -T $n3File $sesameUploadEndpoint
done

#load all sameAs n3 files
N3FILES=/$sameAsn3Dir/*.n3
#load all n3 files in the n3 directory
for n3File in $N3FILES
do
  echo "Processing $n3File file..."
  curl -X POST -H "Content-Type:text/rdf+n3" -T $n3File $sesameUploadEndpoint
done
