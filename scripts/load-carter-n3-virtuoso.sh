
# current directory is /home/jing/saam
carter=$(pwd)
n3Dir=$carter/n3


# delete all triples
# $1 port number;$2 username; $3 password
isql $1 $2 $3 exec="sparql clear graph <http://collection.cartermuseum.org>;"


# upload the files in the directory of n3
N3FILES=$n3Dir/*.n3
for n3File in $N3FILES
do
  echo "Loading $n3File file..."
  isql $1 $2 $3 exec="DB.DBA.TTLP_MT (file_to_string_output ('$n3File'), 'http://collection.cartermuseum.org/id/', 'http://collection.cartermuseum.org');" 
  
done