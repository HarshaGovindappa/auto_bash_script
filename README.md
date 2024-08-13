# Automation-scripts

# Query data from expected_values.csv, We can also use multiple csv files and modify test_script.sh to use for loop to iterate over all the csv files or can also use 
# arguments for csv file input. For this example I have used cwd for csv file path.
# The test_script.sh filr takes input csv file which has petstore data with 5 columns id, category, name, tags, status with 10 rows of data and extract
# unique id in column 1 of each rown and query web api using this unique id and and compare the results from response with the data in csv.
# Install jq and curl before running the test script.
# Make sure executable permisson for test_script.sh file and run the script to start test.
# Unzip auto_bash_script.zip using unzip auto_bash_script.zip
# chmod +x test_script.sh
# script usage ./test_script.sh <csv_file> <api>
# eg. ./test_script.sh get_pet_id_expected_values.csv https://petstore3.swagger.io/api/v3/pet/


# For CI/CD once build and deploy jobs are done, publish the automation scripts over ssh via jenkins and use Exec command space to extract and run automation script.
