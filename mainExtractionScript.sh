#!/bin/bash
# script that automate the script execution, make dir for the new food

foodName=$1
foodFolderName=$1
foodFolderPath="./$1/"
foodUrlRawDataLink=$2
fileWithRawData="./$foodFolderName/$foodName.html"


mkdir $foodFolderName 2> /dev/null

curl $foodUrlRawDataLink -o $fileWithRawData

# main scripts
./macronutrientsExtractionScript.sh $fileWithRawData $foodFolderPath
./mineralsExtractionScript.sh $fileWithRawData $foodFolderPath
./vitaminsExtractionScript.sh "${fileWithRawData}" "${foodFolderPath}"
./other-nutrition-dataExtractionScript.sh "${fileWithRawData}" "${foodFolderPath}"
./carbs-sugarsExtractionScript.sh "${fileWithRawData}" "${foodFolderPath}"
./fatsExtractionScript.sh "${fileWithRawData}" "${foodFolderPath}"
./amino-acidsExtractionScript.sh "${fileWithRawData}" "${foodFolderPath}"


# secondary scripts
${foodFolderPath}fatSectionBeginingExtractionScript.sh ${foodName}
${foodFolderPath}fatSectionOmega3FatsExtractionScript.sh ${foodName}
${foodFolderPath}fatSectionOmega-6FatsExtractionScript.sh ${foodName}
${foodFolderPath}fatSectionSaturatedFatsExtractionScript.sh ${foodName}
${foodFolderPath}fatSectionMonounsaturatedFatsExtractionScript.sh ${foodName}
${foodFolderPath}fatSectionPolyunsaturatedFatsExtractionScript.sh ${foodName}
${foodFolderPath}fatSectionTransFatsExtractionScript.sh ${foodName}
${foodFolderPath}fatSectionPhytosterolsExtractionScript.sh ${foodName}

${foodFolderPath}EssentialAminoAcidsExtractionScript.sh ${foodName}
${foodFolderPath}ConditionallyEssentialAminoAcidsExtractionScript.sh ${foodName}
${foodFolderPath}Non-EssentialAminoAcidsExtractionScript.sh ${foodName}

# vitaminValue=$(tail -n 1 < $foodFolderPath*vitamins.csv)
# echo $vitaminValue
# echo "${1},"$vitaminValue >> main.csv
