#!/bin/bash
# script that automate the script execution, make dir for the new food

foodName=$1
foodFolderName=$1
foodFolderPath="./$1/"
foodUrlRawDataLink=$2
fileWithRawData="./$foodFolderName/$foodName.html"

mkdir $foodFolderName

curl $foodUrlRawDataLink -o $fileWithRawData

# need to fish this file
# ./macronutrientsExtractionScript.sh $fileWithRawData $foodFolderPath
./vitaminsExtractionScript.sh "${fileWithRawData}" "${foodFolderPath}"

vitaminValue=$(tail -n 1 < $foodFolderPath*vitamins.csv)
# echo $vitaminValue
echo "${1},"$vitaminValue >> main.csv
