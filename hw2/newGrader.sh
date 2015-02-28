#!/bin/bash
p=$PWD
dir=$1
echo "dir" is $dir

acount=0
for i in `cat $dir/key`
do
   acount=$((acount+1))
   A[$acount]=$i
   echo A'['$acount']' is $i
done

for i in `ls $dir`
do
   if [ "$i" != "key" ]
   then
      bcount=0
      gradedOut=$dir/graded/$i-Graded
      mkdir $dir/graded &>/dev/null
      touch $gradedOut 
      #echo $i
      #cat $dir/$i
      score=0
      for k in `cat $dir/$i`
      do
	 bcount=$((bcount+1))
	 if [ "$k" == ${A[$bcount]} ]
	 then 
	    echo $k CORRECT  >>$gradedOut
	    score=$((score+1))
	 else
	    echo $k WRONG >>$gradedOut
	 fi
      done
      echo Final grade: $score/$acount >>$gradedOut
   fi
done
