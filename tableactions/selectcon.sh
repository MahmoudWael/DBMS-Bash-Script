#!/bin/bash
select choice in "select all" "select specific columns"
do
	case $choice in
		"select all" )
			awk -F: '{if(NR==1){print}}' data/$1/$2;
			read -p "Enter column name of the condition :" coln;
			read -p "Enter condition value :" val;
			awk -F:  '{
				if(NR==1){
					for(i=1;i<=NF;i++){
						if($i=="'$coln'"){var=i}
					}
				}
				else{
					if($var=='$val'){
						loc=NR
					}
				}
				{if(NR==loc) print
				}
			}' data/$1/$2
			
			;;
		"select specific columns")
			;;
	esac
done