#!usr/bin/env bash

# A strong password has a number, uppercase & lowercase letter, symbol and is longer than 8 characters

# Step 1 - Ensure the user can only input a password longer than 8 characters

#catch unset variable errors
set -u

echo "Time to create a password. A strong password will have 
1) an uppercase and lowercase letter
2) a number
3) a symbol 
4) be longer than 8 characters

Some strong password examples are:" 
echo " "

for ((i=1;i<=3;i++)) #Show 3 examples
do
    # cat /dev/urandom rolls the random dice, piped with tr to remove unwanted bytes, forcing the command to include at least 1 symbol and 1 number.  
    # Fold wraps the lines into groups of 8. Grep fetches only lines containing at least 1 symbol and number. Head retrieves the password that meets these requirements.
    # For now, there is no check for the presence of an uppercase and a lowercase, these will be left up to chance as they have a higher probability of 26/84 to be picked
    # at each iteration of fold
    cat /dev/urandom | tr -dc 'a-zA-Z0-9-_!@#$%^&*()_+{}|:<>?=' | fold -w 8 | grep -i '[!@#$%^&*()_+{}|:<>?=]' | grep -i '[0123456789]' | head -n 1
done
echo " "

echo "Please enter a password and I will tell you how strong it is. "
echo " "
read -p "Enter password: " PASS

#while the password < 8 characters or an empty string
while [ ${#PASS} -lt 8 ] || [ -z ${#PASS} ]
do 
    echo "Please start with a password at least 8 characters long!"
    read -p "Enter password: " PASS # -p allows command line input while displaying the text, saving it to variable PASS
 
done

#echo "Password is longer than 8 characters"
echo " "

# Step 2 - Determine strength of password by checking for presence of an uppercase and lowercase letter, a number and a symbol 

METER=0
if [[ $PASS =~ [A-Z] ]] && [[ $PASS =~ [a-z] ]] # both an uppercase and lowercase, =~ means contains
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

# Step 3 - Return strength of password with the following criteria
#0 = just sad
#1 = weak
#2 = medium
#3 = strong

STRENGTH=""
if [[ METER -lt 1 ]] # < 1
then 
    STRENGTH="just sad"
elif [[ METER -eq 1 ]] # ==  1
then 
    STRENGTH="weak"
elif [[ METER -eq 2 ]] # ==  2
then
    STRENGTH="medium"
else # > 2
    STRENGTH="strong"
fi

echo "Your password gets a rating of ${METER} out of 3. This means that your password is: ${STRENGTH}"