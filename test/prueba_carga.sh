#!/bin/bash

if [ $# -eq 0 ];
then echo "
	# 1. n
	# 2. c
	# 3. archivo de post_data
	# 4. Nombre
	# 5. Apellido
	# 6. Compania"
fi

ab -n $1 -c $2-e resultados-$1-$2.csv -v 4 -T 'aplication/x-www-form-urlencoded' http://www.rsvp-1092.appspot.com/ > output-$1-$2.txt

