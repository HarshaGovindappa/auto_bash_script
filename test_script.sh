#!/bin/bash
#set -xv

# This script parses input csv file for unique id from the records and and calls api with each unique id as parameter and validates teh response

# Provide input csv file path and API url 
CSV_FILE="./csv_data/$1"
API_URL="$2"



test_num=0

# Read the CSV file and validate the data
while IFS="," read -r id category name tags status 
do
    
    # Skip the header line
    if [ "$id" != "id" ]; then
   
      	# Fetch data from the API for unique id
      	response=$(curl -s "${API_URL}""${id}")

      	# Check if the API request was successful for unique id
      	if [ $? -ne 0 ] || [ "$response" == "Pet not found" ]; then
         	echo "Test $test_num : Failed to fetch data from the API."
         	echo "Test $test_num : FAIL : Validation failed for pet ID $id."
            echo "---------------------------------------------------------"
            echo "---------------------------------------------------------"

        else
            
            # Extract data from the API response using jq
            pet_id=$(echo "$response" | jq -r '.id')
            pet_name=$(echo "$response" | jq -r '.name')
            pet_status=$(echo "$response" | jq -r '.status')

            # Validate the data
            if [ "$pet_id" == "$id" ] && [ "$pet_name" == "$name" ] && [ "$pet_status" == "$status" ]; then
                echo "Test $test_num : PASS : Validation successful for pet ID $id."
                echo "---------------------------------------------------------"
                echo "---------------------------------------------------------"
            else
                echo "Test $test_num : FAIL : Validation failed for pet ID $id."
                echo "Test $test_num : Expected: id=$id, Name=$name, Status=$status"
                echo "Test $test_num : Actual: id=$pet_id, Name=$pet_name, Status=$pet_status"
                echo "---------------------------------------------------------"
                echo "---------------------------------------------------------"
            fi

      	fi
        

      	

      	
        
    fi

    test_num=$((test_num+1))
    
    
done < "$CSV_FILE" # Input CSV file 
