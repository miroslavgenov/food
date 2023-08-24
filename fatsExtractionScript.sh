#!/bin/bash
#fats extractions script

fileWithSourceRawDataFile=$1
pathDirectory=$2


extractionTarget="fats"
extractionTargetFolderName=${pathDirectory}"fats"

dataSelectorAndOption="div#${extractionTarget} text{}"


mkdir $extractionTargetFolderName 2> /dev/null

# section of the fat extraction 
# beggining
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 12 > ./$extractionTargetFolderName/begining.txt

# Omega 3 Fats 
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 23 | tail -n 11 > ./$extractionTargetFolderName/Omega3Fats.txt

# Omega-6 Fats
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 34 | tail -n 11  > ./$extractionTargetFolderName/Omega-6Fats.txt

# # Saturated Fats
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 63 | tail -n 29 > ./$extractionTargetFolderName/SaturatedFats.txt

# # Monounsaturated Fats
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 88 | tail -n 25 > ./$extractionTargetFolderName/MonounsaturatedFats.txt

# # Polyunsaturated Fats
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 109| tail -n 21 > ./$extractionTargetFolderName/PolyunsaturatedFats.txt

# # Trans Fats
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 124| tail -n 15 > ./$extractionTargetFolderName/TransFats.txt

# # Phytosterols (Plant Sterols)
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '125~1'p > ./$extractionTargetFolderName/Phytosterols.txt



# use for loop, only the both pair file names are different
# maybe insead of creating it copy it from the already used script
cp ./fatSectionBeginingExtractionScript.sh ${pathDirectory}fatSectionBeginingExtractionScript.sh
# touch ${pathDirectory}fatSectionBeginingExtractionScript.sh
# echo '#!/bin/bash' > ${pathDirectory}fatSectionBeginingExtractionScript.sh
# chmod u+x ${pathDirectory}fatSectionBeginingExtractionScript.sh
# echo "targetLocationToBeFiltered=\""$extractionTargetFolderName/begining.txt"\"" >> ${pathDirectory}fatSectionBeginingExtractionScript.sh

cp ./fatSectionOmega3FatsExtractionScript.sh ${pathDirectory}fatSectionOmega3FatsExtractionScript.sh
# touch ${pathDirectory}fatSectionOmega3FatsExtractionScript.sh
# echo '#!/bin/bash' > ${pathDirectory}fatSectionOmega3FatsExtractionScript.sh
# chmod u+x ${pathDirectory}fatSectionOmega3FatsExtractionScript.sh
# echo "targetLocationToBeFiltered=\""$extractionTargetFolderName/Omega3Fats.txt"\"" >> ${pathDirectory}fatSectionOmega3FatsExtractionScript.sh

cp ./fatSectionOmega-6FatsExtractionScript.sh ${pathDirectory}fatSectionOmega-6FatsExtractionScript.sh
# touch ${pathDirectory}fatSectionOmega-6FatsExtractionScript.sh
# echo '#!/bin/bash' > ${pathDirectory}fatSectionOmega-6FatsExtractionScript.sh
# chmod u+x ${pathDirectory}fatSectionOmega-6FatsExtractionScript.sh
# echo "targetLocationToBeFiltered=\""$extractionTargetFolderName/Omega-6Fats.txt"\"" >> ${pathDirectory}fatSectionOmega-6FatsExtractionScript.sh

cp ./fatSectionSaturatedFatsExtractionScript.sh ${pathDirectory}fatSectionSaturatedFatsExtractionScript.sh
# touch ${pathDirectory}fatSectionSaturatedFatsExtractionScript.sh
# echo '#!/bin/bash' > ${pathDirectory}fatSectionSaturatedFatsExtractionScript.sh
# chmod u+x ${pathDirectory}fatSectionSaturatedFatsExtractionScript.sh
# echo "targetLocationToBeFiltered=\""$extractionTargetFolderName/SaturatedFats.txt"\"" >> ${pathDirectory}fatSectionSaturatedFatsExtractionScript.sh

cp ./fatSectionMonounsaturatedFatsExtractionScript.sh ${pathDirectory}fatSectionMonounsaturatedFatsExtractionScript.sh
# touch ${pathDirectory}fatSectionMonounsaturatedFatsExtractionScript.sh
# echo '#!/bin/bash' > ${pathDirectory}fatSectionMonounsaturatedFatsExtractionScript.sh
# chmod u+x ${pathDirectory}fatSectionMonounsaturatedFatsExtractionScript.sh
# echo "targetLocationToBeFiltered=\""$extractionTargetFolderName/MonounsaturatedFats.txt"\"" >> ${pathDirectory}fatSectionMonounsaturatedFatsExtractionScript.sh

cp ./fatSectionPolyunsaturatedFatsExtractionScript.sh ${pathDirectory}fatSectionPolyunsaturatedFatsExtractionScript.sh
# touch ${pathDirectory}fatSectionPolyunsaturatedFatsExtractionScript.sh
# echo '#!/bin/bash' > ${pathDirectory}fatSectionPolyunsaturatedFatsExtractionScript.sh
# chmod u+x ${pathDirectory}fatSectionPolyunsaturatedFatsExtractionScript.sh
# echo "targetLocationToBeFiltered=\""$extractionTargetFolderName/PolyunsaturatedFats.txt"\"" >> ${pathDirectory}fatSectionPolyunsaturatedFatsExtractionScript.sh

cp ./fatSectionTransFatsExtractionScript.sh ${pathDirectory}fatSectionTransFatsExtractionScript.sh
# touch ${pathDirectory}fatSectionTransFatsExtractionScript.sh
# echo '#!/bin/bash' > ${pathDirectory}fatSectionTransFatsExtractionScript.sh
# chmod u+x ${pathDirectory}fatSectionTransFatsExtractionScript.sh
# echo "targetLocationToBeFiltered=\""$extractionTargetFolderName/TransFats.txt"\"" >> ${pathDirectory}fatSectionTransFatsExtractionScript.sh

cp ./fatSectionPhytosterolsExtractionScript.sh ${pathDirectory}fatSectionPhytosterolsExtractionScript.sh
# touch ${pathDirectory}fatSectionPhytosterolsExtractionScript.sh
# echo '#!/bin/bash' > ${pathDirectory}fatSectionPhytosterolsExtractionScript.sh
# chmod u+x ${pathDirectory}fatSectionPhytosterolsExtractionScript.sh
# echo "targetLocationToBeFiltered=\""$extractionTargetFolderName/Phytosterols.txt"\"" >> ${pathDirectory}fatSectionPhytosterolsExtractionScript.sh
