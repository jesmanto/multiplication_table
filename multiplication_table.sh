#!/bin/bash

# Get user's input
read -p "Enter a number for the multiplication table: " num

# This function checks to validate the user input
isValidNumber() {
	[[ "$1" =~ ^[0-9]+$ ]]
}

# check for validity
if isValidNumber "$num"
then
	# Number is valid. Ask user for full or partial table
	read -p "Do you want a full table or a partial table? (Enter 'f' for full, 'p' for partial): " range

	if [ $range != "p" ]; then
	# User wants full multiplication table
		echo "The full multiplication table for $num: "

		# Using a List Form forloop for iteration
		for i in {1..10}; do
			echo "$num x $i = $((num*i))"
		done
	else
	# User wants a partial multiplication table. Ask user for range
		read -p "Enter the starting number (between 1 and 10): " starting
		read -p "Enter the ending number (between 1 and 10): " ending

		# User specifies a valid range
		if isValidNumber "$starting" && isValidNumber "$ending"; then

			# Handle out-of-bound range
               		 if [ $starting -lt 1 ] || [ $ending -gt 10 ] || [ $starting -gt $ending ]
               		 then
                       		 echo "Range Out-of-Bound. Showing full table instead."
                       		 echo "The full multiplication table for $num: "

                       		 # Using a List Form forloop for iteration
                       		 for i in {1..10}; do
                               		 echo "$num x $i = $((num*i))"
                       		 done
			else
				echo "The partial multiplication table for $num from $staring to $ending:"

				# Using a C-Type forloop
				for (( i=starting; i<=ending; i++ )); do
					echo "$num x $i = $((num*i))"
				done
			fi
		else
		# Users range not valid. Show full table instead
			echo "Invalid range. Showing full table instead."
			echo "The full multiplication table for $num: "

			# Using a List Form forloop for iteration
                	for i in {1..10}; do
                        	echo "$num x $i = $((num*i))"
                	done
		fi
	fi
else
	# Prints an error message if the number is invalid
	echo "ERROR: Invalid number"
fi
