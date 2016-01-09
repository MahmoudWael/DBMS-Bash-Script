#!/bin/bash
select myvar in createDB renameDB dropDB  usedatabase
do
	case $myvar in
		createDB )	
			read -p "Enter DB Name: " dbname
			bash dbactions/createdb.sh $dbname
			;;
		renameDB )
			
			bash dbactions/renamedb.sh
			;;
		dropDB )  dbactions/dropdb.sh
			;;

		usedatabase )
				bash usedatabase.sh
			;;
		* ) echo "what is $REPLY";
			exit
			;;
	esac

done