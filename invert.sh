#!/bin/bash

if [ -d "$1" ]; then
  regex='^(.+)( - )(.+)[\.](.+)'
  cd "$1" 
  for i in *; do
  	if [ -f "$i" ]; then
  		if [[ $i =~ $regex ]]; then
  			artist="${BASH_REMATCH[1]}"
  			music="${BASH_REMATCH[3]}"
  			extension="${BASH_REMATCH[4]}"
  			newName="$music - $artist.$extension"
  			mv -v "$i" "$newName"
  		fi
  	fi
  done
else
	echo 'Diretório não informado ou não existente'
fi
