#!/bin/bash
#Create a MySQL db called ``hw3'' and use it

#Create table called COMMANDS with columns:
#	path VARCHAR(100)
#	size DECIMAL(8)
#	perm VARCHAR(9)

#Loop over a generated list of files in
#	/bin
#	/sbin
#	/usr/bin
#	/usr/local/bun
#	/usr/sbin
#that are dynamically linked (use the file command to determine) and from this
#list extract the:
#	full pathname
#	size in bytes
#	permission modes

#Put these values in an ``insert statement'' and in the loop send the statement
#to MySQL to fill the table.

#After loading the table, select the five largest values and show the output.
#The output should be of the form ``path, size''

#Generate a list of all the files that have the SUID bit set.
#Output should be of the form ``path, perm''

