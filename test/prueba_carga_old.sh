#!/bin/bash

if [ $# -eq 0 ];
then echo "
	# 1. Cantidad de requests POST a generar
	# 2. 1 si todos los requests son iguales, 0 diferentes
	# 3. Mail
	# 4. Nombre
	# 5. Apellido
	# 6. Compania"
	exit
fi

if [ $# -eq 2 ];
then	m="prueba@test.com"
	n="Juan"
	a="Perez"
	c="Test Inc."
else 	m=$3
	n=$4
	a=$5
	c=$6
fi

if [ $2 -eq 1 ];
then 	for (( c=1; c <= $1;c++ ))
	do
		wget --post-data "mail=$m&nombre=$n&apellido=$a&cnia=$c" -O /dev/null | grep  >> &
	done
	exit
fi

if [ $2 -eq 0 ];
then	for (( c=1; c <= $1;c++ ))
	do
		let m=$3+c
		wget --post-data "mail=$m&nombre=$n&apellido=$a&cnia=$c" -O /dev/null  &
	done
	exit
fi
