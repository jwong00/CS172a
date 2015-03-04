#!/bin/bash
#Create a MySQL db called ``hw3'' and use it
mysql -u root -pqwer << EOF
CREATE DATABASE IF NOT EXISTS hw3;
USE hw3;

#Create table called COMMANDS with columns:
#	path VARCHAR(100)
#	size DECIMAL(8)
#	perm VARCHAR(9)

CREATE TABLE IF NOT EXISTS COMMANDS (
	path VARCHAR(100),
	size DECIMAL(8),
	perm VARCHAR(9)
)
EOF

#Loop over a generated list of files in
#	/bin
#	/sbin
#	/usr/bin
#	/usr/local/bin
#	/usr/sbin
#that are dynamically linked (use the file command to determine) and from this
#list extract the:
#	full pathname
#	size in bytes
#	permission modes
#Put these values in an ``insert statement'' and in the loop send the statement
#to MySQL to fill the table.
for dir in /bin #/sbin #/usr/bin /usr/local/bin /usr/sbin
do
		  echo $dir
		  for i in `ls $dir`
		  do	
#					 ./dtest.sh $dir/$i
					 afile=`file $dir/$i`
#					 #echo $file
					 if [[ $afile == *"dynamically"* ]]
					 then 
								echo $i is dynamically linked
								perm=$(ls -ld "$dir/$i" | sed 's/^.//' | sed 's/ .*$//')
								size=$(ls -ld "$dir/$i" | tr -s " " | cut -f5 -d" ")
								p="$dir/$i"
								echo insert into COMMANDS VALUES "( '$p', '$size', '$perm');"
					 else echo $i is not dynamically linked
					 fi		
#					 echo $i >> filelist.txt
		  done
done


#After loading the table, select the five largest values and show the output.
#The output should be of the form ``path, size''

#Generate a list of all the files that have the SUID bit set.
#Output should be of the form ``path, perm''

echo $0 done.

