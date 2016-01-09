#!/bin/bash
echo "Available tables in $1";
ls data/$1;
read -p "Enter table Name: " updtb;

if [[ -f data/$1/$updtb ]]; then
	awk -F: '{if(NR==1){print $0}}' data/$1/$updtb;
	read -p "Enter column to be updated : " colupd;
	read -p "Enter new value : " vl;
	read -p "Enter the column (where) : " wherecl;
	read -p "Enter the value : "	wherevl; 
	awk -F:  '
	{
		if(NR==1){
			for(i=1;i<=NF;i++){
				if($i=="'$colupd'"){var=i}else{if($i=="'$wherecl'"){vaa=i}}
			}
		}
		else{
			if($vaa=='$wherevl'){
				$var="'$vl'"
			}
		}
		{print}
	}' data/$1/$updtb > tmp && mv tmp data/$1/$updtb;
	
else
	echo "$updtb doesn't exist";
fi

# -v vl=$vl -v wherecl=$wherecl -v wherevl=$wherevl

