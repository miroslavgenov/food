#!/bin/bash
# script that automate the script execution, make dir for the new food

foodName=$1
foodFolderName=$1
foodFolderPath="./$1/"
foodUrlRawDataLink=$2
fileWithRawData="./$foodFolderName/$foodName.html"


mkdir $foodFolderName 2> /dev/null

curl $foodUrlRawDataLink -o $fileWithRawData

# need to fish this file
# ./macronutrientsExtractionScript.sh $fileWithRawData $foodFolderPath
# ./mineralsExtractionScript.sh $fileWithRawData $foodFolderPath
# ./vitaminsExtractionScript.sh "${fileWithRawData}" "${foodFolderPath}"


# main scripts
# macronutrientsExtractionScript.sh done
# mineralsExtractionScript.sh done
# vitaminsExtractionScript.sh done

# other-nutrition-dataExtractionScript.sh
# carbs-sugarsExtractionScript.sh
# fatsExtractionScript.sh
# amino-acidsExtractionScript.sh


# secondary scripts
# ConditionallyEssentialAminoAcidsExtractionScript.sh
# EssentialAminoAcidsExtractionScript.sh
# fatSectionBeginingExtractionScript.sh
# fatSectionMonounsaturatedFatsExtractionScript.sh
# fatSectionOmega3FatsExtractionScript.sh
# fatSectionOmega-6FatsExtractionScript.sh
# fatSectionPhytosterolsExtractionScript.sh
# fatSectionPolyunsaturatedFatsExtractionScript.sh
# fatSectionSaturatedFatsExtractionScript.sh
# fatSectionTransFatsExtractionScript.sh
# Non-EssentialAminoAcidsExtractionScript.sh

# vitaminValue=$(tail -n 1 < $foodFolderPath*vitamins.csv)
# echo $vitaminValue
# echo "${1},"$vitaminValue >> main.csv
