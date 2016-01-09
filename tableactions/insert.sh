#!/bin/bash
echo "Available tables in $1"
ls data/$1
read -p "Enter table Name: " insertb
if [[ -f data/$1/$insertb ]]; then
	typeset -i nf=`awk -F: '{if(NR==1){print NF}}' data/$1/$insertb;`
	
	for (( i = 1; i <= $nf; i++ )); do
	 	colname=`awk -F: -v"i=$i" '{if(NR==1){print $i}}' data/$1/$insertb;`
	 	coltype=`awk -F: -v"i=$i" '{if(NR==1){print $i}}' data/$1/$insertb.tp;`
	 	flag=0;
	 	while [[ $flag -eq 0 ]]; do
	 		read -p "Enter $colname " value;
		 	if [[ $coltype = "int" && "$value" = +([0-9]) || $coltype = "string" && "$value" = +([a-zA-Z]) ]]; then
		 		if [[ $i != $nf ]]; then
		 			echo -n $value":" >> data/$1/$insertb;
		 		else	
		 			echo $value >> data/$1/$insertb;
		 		fi
		 		flag=1;
		 	fi
	 	done
	done
 	
else
	echo "$insertb doesn't exist";
fi

#x=`awk -F: '{if(NR==1){print $1}}' data/shreef/lollll;`
# awk -F: -v"i=$i" '{if(NR==1){print $i}}' data/shreef/lollll  && $value = +(0-9)

