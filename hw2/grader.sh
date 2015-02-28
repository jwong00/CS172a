#!/bin/bash
#assuming (for now) that $1 is just a numeric argument (which homework number?)
p=$PWD
>$p/results.hw$1 #output results to a new file in the current working dir

numq=`wc -l hw$1/answers |cut -f1 -d" "` #store number of questions

#store each line in array
acount=0
for i in `cat hw$1/answers` 
do
acount=$((acount+1))
A[$acount]=$i
# echo A'[' $acount ']' is $i
done

for i in `ls students`
do
	bcount=0
	pushd students/$i &>/dev/null
	echo now in $PWD &>/dev/null
	if [ -f hw$1 ] 
		#check for existence of file
		#check to see if file is regular
	then
		WRONG=""
		correct=0
		for j in `cat hw$1` #for each file in directory hw$1
		do
			bcount=$((bcount+1))
			if [ "$j" != ${A[$bcount]} ]
			then
				WRONG=`echo $WRONG $j " "`
			else
				correct=$((correct+1))
			fi
		done
	s=$(echo "scale=2; $correct / $numq" |bc )
	echo $i SCORE $s wrong were $WRONG >>$p/results.hw$1
	else s=0
	fi
	printf "%s,%4.2f\n" $i $s >>$p/scores_hw$1.csv
	
	popd &>/dev/null
done
