### Commands to post the N3 files to the triple store
### 
### Execute this script from the main saam-lod directory: sh scripts/load-rdf.sh
###


# Uncomment to clear the repo 
#curl -X DELETE http://lod.isi.edu/openrdf-sesame/repositories/saam_openrdf/statements

# Post all the N3 files
curl -X POST -H "Content-Type:text/rdf+n3" -T n3/WebConstituents.n3 http://lod.isi.edu/openrdf-sesame/repositories/saam_openrdf/statements?baseURI='<http://collection.americanart.si.edu/id/>'