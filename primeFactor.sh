#!/bin/bash -x
read -p "Enter your number to check prime factors :" num
j=0
for((i=2;i<$num;i++))
do
	if(($(($num%$i))==0 ))
	then	
		isPrime=1
		for((k=2;k<$i;k++))
		do
			if(($(($i%$k))==0))
			then
			isPrime=0
			break;
			fi
			
		done
		if [ $isPrime -eq 1 ]
                then array[j++]=$i
                fi
	
	fi
done
if [ ${#array[@]} -eq 0 ]
then    echo This number does not have any prime factor;
else	echo Prime factors of $num : ${array[@]}
fi
