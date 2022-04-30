#!/bin/bash -x
function biggest(){

array[0]=$1
array[1]=$2
array[2]=$3
array[3]=$4

for ((i = 0; i<$((${#array[@]}-1)); i++))
do
    
    for((j = $i+1; j<$((${#array[@]})); j++))
    do
    
        if [ ${array[$i]} -gt ${array[$j]} ]
        then
            # swap
            temp=${array[$i]}
            array[$i]=${array[$j]}  
            array[$j]=$temp
        fi
    done
done
echo  Largest winning number : ${array[$((${#array[@]}-1))]}
}



read -p "Enter how many times do you want to flip a coin: " num
a=0
b=0
c=0
d=0
for((i=0;i<$num;i++))
do
	n=$((RANDOM%2))
	echo $n
	declare -A dic
	if(($n==1))
	then ((a++))
	dic[$i]="Head"
	echo Head
	else ((b++))
	dic[$i]="Tail"
	echo Tail
	fi
	
done
echo Head occurred in singlet :$a times
echo Tail occurred in singlet: $b times
for key in ${!dic[@]}
do
	echo ${dic[$key]};
done
echo Percentage of winning HEAD in singlet : $(($a*100/$num))
echo Percentage of winning TAIL in singlet : $(($b*100/$num))
echo "IN SINGLET................................."
biggest $a $b $c $d

a=0
b=0
c=0
d=0

for((i=0;i<$num;i++))
do
        n1=$((RANDOM%2))
	n2=$((RANDOM%2))
       
        declare -A doublet
        if(($n1==1 && $n2==1))
        then ((a++))
        doublet[$i]="HH"
        elif(($n1==1 && $n2==0))
	then ((b++))
        doublet[$i]="HT"
        
	elif(($n1==0 && $n2==1))
        then ((c++))
        doublet[$i]="TH"
         
	else(($n1==0 && $n2==0))
	((d++))
        doublet[$i]="TT"
        
	fi
        
done
echo HH occurred in doublet :$a times
echo HT occurred in doublet :$b times
echo TH occurred in doublet :$c times
echo TT occurred in doublet :$d times
echo "IN DOUBLET............................"
biggest $a $b $c $d


for key in ${!doublet[@]}
do
        echo ${doublet[$key]};
done
echo Percentage of winning HH in doublet : $(($a*100/$num))
echo Percentage of winning HT in Doublet : $(($b*100/$num))
echo Percentage of winning TH in Doublet : $(($c*100/$num))
echo Percentage of winning TT in Doublet: $(($d*100/$num))
