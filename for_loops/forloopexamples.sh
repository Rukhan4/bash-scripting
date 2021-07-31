#!usr/bin/env bash

#Method 1 
list=(1 2 3)
for element in ${list[@]}
do
    echo $element
done

echo " " #Space between methods - can use prinf "/n" instead

#Method 2 
for element in {1..3}
do 
    echo $element
done

echo " "

#Method 3 
for (( c=1; c<=3; c++ ))
do
    echo $c
done
