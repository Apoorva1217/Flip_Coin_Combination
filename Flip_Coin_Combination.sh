#!/bin/bash -x

r=$((RANDOM%2))
if [ $r -eq 1 ]
then
        echo "Head"
else
        echo "Tail"
fi
echo "Enter number of flip:"
read n

declare -A dict

dict[H]=0
dict[T]=0
for((i=0;i<n;i++))
do
        r=$((RANDOM%2))
        if [ $r -eq 0 ]
	then
                val=${dic[H]}
                dict[H]=$((val+1))
        else
                val=${dict[T]}
                dict[T]=$((val+1))
        fi
done
val=${dict[H]}
echo "head percentage:"
echo "scale=2;$val/$n*100" | bc

val=${dict[T]}
echo "tail percentage:"
echo "scale=2;$val/$n*100" | bc

