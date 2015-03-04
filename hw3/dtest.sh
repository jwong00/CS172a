#!/bin/bash
file=`file $1`
if [[ $file == *"dynamically"* ]]
then echo $1 is dynamically linked
else echo $1 is not dynamically linked
fi
