Two sources have invalid rdf data: 
dbo.Place_view.csv-model.n3 and dbo.TermsWithPathView_view.csv-model.n3

Do some replacements in the python:

\\ 		->	/
\ 		->	/
/"		->	/
"/		->	/
_/		->	/
/_		->	/
_"		->	"
"_		->	"
_>		->	>
_&_		->	_
/>		->	>
">		->	>
/"		->	>
._ .	->	." .
