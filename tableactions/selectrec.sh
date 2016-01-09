#!/bin/bash
echo "Available tables in $1";
ls data/$1;
read -p "Enter table Name: " seltb;
select choice in "Select all columns" "select specific columns" "select columns where condition" "sum" "average" "count"
do
	case $choice in
		 "Select all columns") awk -F: '{print}' data/$1/$seltb
			;;
		"select specific columns")

			read -p "Enter Number of columns: " number;
			for (( i = 1; i <= number; i++ )); do
				read -p "Enter column $i: " colname;
				awk -F: '{if(NR=1){
					for(i=1 ;i <= NF; i++){
								if($i=="'$colname'"){
									var=i
							    break;
							}
						}
					} {print $var}
				}' data/$1/$seltb
			done
			;;

		"select columns where condition") 
			bash tableactions/selectcon.sh $1 $seltb;
			;; 
		"sum") 
				read -p "Enter column $i: " colname;
				awk -F: 'BEGIN{sum=0;}{if(NR=1){
					for(i=1 ;i <= NF; i++){
								if($i=="'$colname'"){
									var=i
							    break;
							}
						}
					} {sum+=$var}
				}END{print "Sum="sum}' data/$1/$seltb
				;;
		"average")
				read -p "Enter column $i: " colname;
				awk -F: 'BEGIN{sum=0;counter=0}{if(NR=1){
					for(i=1 ;i <= NF; i++){
								if($i=="'$colname'"){
									var=i
							    break;
							}
						}
					} {sum+=$var;counter++}
				}END{avg=sum/(counter-1); print "average="avg}' data/$1/$seltb
		;;
		"count")
				read -p "Enter column $i: " colname;
				awk -F: 'BEGIN{counter=0}{if(NR=1){
					for(i=1 ;i <= NF; i++){
								if($i=="'$colname'"){
									var=i
							    break;
							}
						}
					} {counter++}
				}END{print "Count="(counter-1)}' data/$1/$seltb
		;;
	esac
done

