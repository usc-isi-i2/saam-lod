### Script to post the N3 files to the triple store
### 
### Execute this script from the main saam-lod directory: sh scripts/load-rdf.sh <n3 filename>
###

#!/bin/bash

# Uncomment to clear the repo 
#curl -X DELETE http://lod.isi.edu/openrdf-sesame/repositories/saam_openrdf/statements

# Post all the N3 files
sesameEndpoint=http://lod.isi.edu/openrdf-sesame/repositories/saam_openrdf/statements
sesameUploadEndpoint=$sesameEndpoint?baseURI='<http://collection.americanart.si.edu/id/>'

echo curl -X POST -H "Content-Type:text/rdf+n3" -T $1 $sesameUploadEndpoint
curl -X POST -H "Content-Type:text/rdf+n3" -T $1 $sesameUploadEndpoint
