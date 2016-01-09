#!/bin/bash
read -p "Enter Table Name: " tbname
if [[ -f data/$1/$tbname ]]; then
	echo "Table $tbname already exists";
else
	touch data/$1/$tbname;
	read -p "Enter No of columns :" n;

	for (( i = 1; i <= n; i++ )); do
		read -p "Enter column $i name :" name;
		read -p "Enter column datatype : [string/int]" dtype;
		while [[ "$dtype" != *(int)*(string) || -z "$dtype" ]]; do
			echo "Invalid datatype";
			read -p "Enter column datatype : [string/int]" dtype;
		done
		if [[ i -eq n ]]; then
			echo  $name >> data/$1/$tbname;
			echo  $dtype >> data/$1/$tbname.tp;

		else
			echo -n $name":" >> data/$1/$tbname;
			echo -n $dtype":" >> data/$1/$tbname.tp;
		fi

	done
	echo "$tbname has been created"
fi

