
This repository contains a set of automation scripts designed to query a web API using data from a CSV file and validate the responses against expected values.

Prerequisites
1. Install jq and curl: Ensure that jq (a JSON processor) and curl (a tool to transfer data from or to a server) are installed on your system. 
You can install them using the following commands:
CentOS - sudo yum install jq curl

2. Unzip the auto_bash_script.zip: Before running the script, unzip the provided archive:
unzip auto_bash_script.zip

3. Set Executable Permissions: Ensure the script has executable permissions:
   chmod +x test_script.sh
   
4. Running the Script
To run the script, use the following syntax:
./test_script.sh <csv_file> <api>

Example: ./test_script.sh get_pet_id_expected_values.csv https://petstore3.swagger.io/api/v3/pet/


Script Functionality
1. Iterate Over CSV Files:
The script can be modified to iterate over multiple CSV files using a for loop.
Alternatively, you can pass CSV files as arguments.
2. Query the API:
The script extracts the unique id from the first column of each row.
It uses curl to query the web API with the extracted id.
The response is processed using jq to compare the results with the data in the CSV.


CI/CD Integration with Jenkins
For continuous integration and deployment, you can automate the process using Jenkins:
1. Publish Scripts via SSH:
Once the build and deploy jobs are completed, use Jenkins to publish the automation scripts over SSH.
Use the "Exec command" space in Jenkins to extract and run the automation script.
2. Jenkins Configuration:
Configure SSH settings in Jenkins to securely transfer and execute scripts on remote servers.
Use plugins like "Publish Over SSH" to facilitate this process.
By following this documentation, you can effectively use the test_script.sh to automate API testing with CSV data and integrate it into your CI/CD pipeline.
