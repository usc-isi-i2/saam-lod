::set tablename=cbev2.WebCondates
::set modelFile=G:\工程\ISI\saam-lod\crm-models\test\cbev2.WebConDates-model.ttl
::set n3Filename=G:\工程\ISI\saam-lod\n3\cbev2.WebConDates.n3

::set tablename=dbo.WebMakers_view
::set modelFile=G:\工程\ISI\saam-lod\crm-models\test\dbo.WebMakers_view-model.ttl
::set n3Filename=G:\工程\ISI\saam-lod\n3\dbo.WebMakers_view.n3

::set tablename=cbev2.WebArtistBioImages
::set modelFile=G:\工程\ISI\saam-lod\crm-models\test\cbev2.WebArtistBioImages-model.ttl
::set n3Filename=G:\工程\ISI\saam-lod\n3\cbev2.WebArtistBioImages.n3

::set tablename=cbev2.WebConAltNames
::set modelFile=G:\工程\ISI\saam-lod\crm-models\test\cbev2.WebConAltNames-model.ttl
::set n3Filename=G:\工程\ISI\saam-lod\n3\cbev2.WebConAltNames.n3

set tablename=cbev2.WebConGeography
set modelFile=G:\工程\ISI\saam-lod\crm-models\test\cbev2.WebConGeography-model.ttl
set n3Filename=G:\工程\ISI\saam-lod\n3\cbev2.WebConGeography.n3


echo "Processing %name% file on table tablename ..."
mvn exec:java -Dexec.mainClass="edu.isi.karma.rdf.OfflineRdfGenerator" -Dexec.args=" --sourcetype DB --dbtype SQLServer --hostname lod.isi.edu --username sa --password isi4676 --portnumber 1433 --dbname smithsonian02042014 --tablename %tablename% --modelfilepath %modelFile% --outputfile %n3Filename%" -Dexec.classpathScope=compile
  echo "Done with %modelFile% file on table %tablename%"
  
 ::for  %%s in (G:\工程\ISI\saam-lod\crm-models\test\*.ttl ) do 




 
