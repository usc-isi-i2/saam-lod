
# current directory is /home/jing/saam
saam=$(pwd)
n3Dir=$saam/n3
seeAlsoDir=$saam/n3/n3-seeAlso

# delete all triples
# $1 port number;$2 username; $3 password
isql $1 $2 $3 exec="sparql clear graph <http://collection.americanart.si.edu>;"


# upload the files in the directory of n3
N3FILES=$n3Dir/*.n3
for n3File in $N3FILES
do
  echo "Loading $n3File file..."
  isql $1 $2 $3 exec="DB.DBA.TTLP_MT (file_to_string_output ('$n3File'), 'http://collection.americanart.si.edu/id/', 'http://collection.americanart.si.edu');" 
  
done

# upload the files in the directory of n3/n3-seeAlso
N3FILES=$seeAlsoDir/*.n3
for n3File in $N3FILES
do
  echo "Loading $n3File file..."
  isql $1 $2 $3 exec="DB.DBA.TTLP_MT (file_to_string_output ('$n3File'), 'http://collection.americanart.si.edu/id/', 'http://collection.americanart.si.edu');" 
done

