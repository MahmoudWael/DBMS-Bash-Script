#!/bin/bash
echo "Available DataBases"
ls -1 data/
read -p "Enter DataBase Name: " db
if [[ -d data/$db ]]; then
	select varuse in "create table" "drop table" "update table" "insert record" "Delete from table" "Select from table"
	do
		case $varuse in
			"create table" )	
				bash tableactions/createtable.sh $db
				;;
			"drop table" )
				bash tableactions/droptable.sh $db
				;;
			"update table" )  
				tableactions/updatetable.sh $db
				;;
			"insert record")
				tableactions/insert.sh $db
				;;
			"Delete from table" )  
					bash tableactions/deleterec.sh $db
				;;
			"Select from table" )
					bash tableactions/selectrec.sh $db
				;;
			* ) echo "what is $REPLY";
				exit
				;;
		esac

	done
else
	echo "$db isn't a DataBase";
fi