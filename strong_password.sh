#!usr/bin/env bash

# A strong password has a number, uppercase, symbol and is longer than 5 characters

#Step 1 - Ensure the user can only input a password longer than 5 characters

set -u

echo "Time to create a password. A strong password should have an uppercase and lowercase letter, a number and a symbol, as well as be longer than 5 characters. Please enter a password and I will tell you how strong it is  "
echo " "
read -p "Enter password: " PASS

while [ ${#PASS} -le 5 ] && [ -z ${#PASS} ]
do 
    echo "Please at least choose a password longer than 5 characters"
    read -p "Enter password: " PASS
 
done

#echo "Password is longer than 5 characters"
echo " "

#Step 2 - Determine strength of password by checking for presence of an uppercase and lowercase letter, a number and a symbol 

METER=0
if [[ $PASS =~ [A-Z] ]] && [[ $PASS =~ [a-z] ]] # both an uppercase and lowercase
then   
    let METER=METER+1
fi

if [[ $PASS =~ [0-9] ]] # a digit
then
    let METER=METER+1
fi

#LC_COLLATE=C
if [[ $PASS =~ [^a-zA-Z0-9] ]] #contains a symbol (non alphanumeric)
then   
    let METER=METER+1
fi

#Return strength of password
#0 = just sad
#1 = weak
#2 = medium
#3 = strong

STRENGTH=""
if [[ METER -lt 1 ]]
then 
    STRENGTH="just sad"
elif [[ METER -eq 1 ]]
then 
    STRENGTH="weak"
elif [[ METER -eq 2 ]]
then
    STRENGTH="medium"
else
    STRENGTH="strong"
fi

echo "Your password gets a rating of ${METER} out of 3. This means that your password is: ${STRENGTH}"