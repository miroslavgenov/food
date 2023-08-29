#!/bin/bash

foodName=$1
url=$2

./mainExtractionScript.sh $foodName $url

currentDirectory=$(pwd)
mainFoodSectionUnfiltederName="main.txt"
mainFoodSectionDataUnfilteredPath=$(echo -n ${currentDirectory}/${foodName}/${mainFoodSectionUnfiltederName})

mainCsvName="main.csv"

mainCsvPath=$(echo -n ${currentDirectory}/${foodName}/${mainCsvName})

# normal
# echo "Macronutrients" && 
cat ${currentDirectory}/${foodName}/*Macronutrients*  > ${mainFoodSectionDataUnfilteredPath}
# echo "minerals" && 
cat ${currentDirectory}/${foodName}/*minerals* >> ${mainFoodSectionDataUnfilteredPath}
# echo "vitamins" && 
cat ${currentDirectory}/${foodName}/*vitamins* >> ${mainFoodSectionDataUnfilteredPath}
# echo "other-nutrition-data" && 
cat ${currentDirectory}/${foodName}/*other-nutrition-data* >> ${mainFoodSectionDataUnfilteredPath}
# echo "carbs-sugars" && 
cat ${currentDirectory}/${foodName}/*carbs-sugars* >> ${mainFoodSectionDataUnfilteredPath}


#fats 
cat ${currentDirectory}/${foodName}/fats/begining*.csv >> ${mainFoodSectionDataUnfilteredPath}
cat ${currentDirectory}/${foodName}/fats/Omega3Fats*.csv  >> ${mainFoodSectionDataUnfilteredPath}
cat ${currentDirectory}/${foodName}/fats/Omega-6Fats*.csv  >> ${mainFoodSectionDataUnfilteredPath}
cat ${currentDirectory}/${foodName}/fats/SaturatedFats*.csv  >> ${mainFoodSectionDataUnfilteredPath}
cat ${currentDirectory}/${foodName}/fats/MonounsaturatedFats*.csv  >> ${mainFoodSectionDataUnfilteredPath}
cat ${currentDirectory}/${foodName}/fats/PolyunsaturatedFats*.csv  >> ${mainFoodSectionDataUnfilteredPath}
cat ${currentDirectory}/${foodName}/fats/TransFats*.csv  >> ${mainFoodSectionDataUnfilteredPath}
cat ${currentDirectory}/${foodName}/fats/Phytosterols*.csv  >> ${mainFoodSectionDataUnfilteredPath}

# amino-acids
# echo "EssentialAminoAcids" && 
cat ${currentDirectory}/${foodName}/amino-acids/EssentialAminoAcids*csv >> ${mainFoodSectionDataUnfilteredPath}
# echo "ConditionallyEssentialAminoAcids" && 
cat ${currentDirectory}/${foodName}/amino-acids/ConditionallyEssentialAminoAcids*csv >> ${mainFoodSectionDataUnfilteredPath}
# echo "Non-EssentialAminoAcids" && 
cat ${currentDirectory}/${foodName}/amino-acids/Non-EssentialAminoAcids*csv >> ${mainFoodSectionDataUnfilteredPath}


sed -n '1~3'p < ${mainFoodSectionDataUnfilteredPath} | paste -sd ',' > ${mainCsvPath}
sed -n '2~3'p < ${mainFoodSectionDataUnfilteredPath} | paste -sd ',' >> ${mainCsvPath}
sed -n '3~3'p < ${mainFoodSectionDataUnfilteredPath} | paste -sd ',' >> ${mainCsvPath}



test -e main.csv
isFileExists=$?
if [ $isFileExists -eq 1 ]; then
    touch main.csv
    sed -n '1~3'p < ${mainFoodSectionDataUnfilteredPath} | paste -sd ',' > main.csv
    sed -n '2~3'p < ${mainFoodSectionDataUnfilteredPath} | paste -sd ',' >> main.csv
else
    sed -n '2~3'p < ${mainFoodSectionDataUnfilteredPath} | paste -sd ',' >> main.csv
fi
