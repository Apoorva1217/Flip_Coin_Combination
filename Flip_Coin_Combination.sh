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

dict[HH]=0
dict[HT]=0
dict[TH]=0
dict[TT]=0

for((i=0;i<n;i++))
do
        r=$((RANDOM%4))
        if [ $r -eq 0 ]
        then
                val=${dic[HH]}
                dict[HH]=$((val+1))
        elif [ $r -eq 1 ]
        then
                val=${dict[HT]}
		dict[HT]=$((val+1))
        elif [ $r -eq 2 ]
        then
                val=${dict[TH]}
                dict[TH]=$((val+1))
        else
                val=${dict[TT]}
                dict[TT]=$((val+1))
        fi
done
echo "HH percentage:"
val=${dict[HH]}
dict[HH]=`echo "scale=2;$val/$n*100" | bc`
echo ${dict[HH]}

echo "HT percentage:"
val=${dict[HT]}
dict[HT]=`echo "scale=2;$val/$n*100" | bc`
echo ${dict[HT]}

echo "TH percentage:"
val=${dict[TH]}
dict[TH]=`echo "scale=2;$val/$n*100" | bc`
echo ${dict[TH]}

echo "TT percentage:"
val=${dict[TT]}
dict[TT]=`echo "scale=2;$val/$n*100" | bc`
echo ${dict[TT]}
