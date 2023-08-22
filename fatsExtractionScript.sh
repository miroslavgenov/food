#!/bin/bash
#fats extractions script

fileWithSourceRawDataFile=$(ls *.html)

extractionTarget="fats"
extractionTargetFolderName="fats"

dataSelectorAndOption="div#${extractionTarget} text{}"

mkdir $extractionTargetFolderName

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
touch fatSectionBeginingExtractionScript.sh
echo '#!/bin/bash' > fatSectionBeginingExtractionScript.sh
chmod u+x fatSectionBeginingExtractionScript.sh
echo "targetLocationToBeFiltered=\""./$extractionTargetFolderName/begining.txt"\"" >> fatSectionBeginingExtractionScript.sh

touch fatSectionOmega3FatsExtractionScript.sh
echo '#!/bin/bash' > fatSectionOmega3FatsExtractionScript.sh
chmod u+x fatSectionOmega3FatsExtractionScript.sh
echo "targetLocationToBeFiltered=\""./$extractionTargetFolderName/Omega3Fats.txt"\"" >> fatSectionOmega3FatsExtractionScript.sh

touch fatSectionOmega-6FatsExtractionScript.sh
echo '#!/bin/bash' > fatSectionOmega-6FatsExtractionScript.sh
chmod u+x fatSectionOmega-6FatsExtractionScript.sh
echo "targetLocationToBeFiltered=\""./$extractionTargetFolderName/Omega-6Fats.txt"\"" >> fatSectionOmega-6FatsExtractionScript.sh

touch fatSectionSaturatedFatsExtractionScript.sh
echo '#!/bin/bash' > fatSectionSaturatedFatsExtractionScript.sh
chmod u+x fatSectionSaturatedFatsExtractionScript.sh
echo "targetLocationToBeFiltered=\""./$extractionTargetFolderName/SaturatedFats.txt"\"" >> fatSectionSaturatedFatsExtractionScript.sh

touch fatSectionMonounsaturatedFatsExtractionScript.sh
echo '#!/bin/bash' > fatSectionMonounsaturatedFatsExtractionScript.sh
chmod u+x fatSectionMonounsaturatedFatsExtractionScript.sh
echo "targetLocationToBeFiltered=\""./$extractionTargetFolderName/MonounsaturatedFats.txt"\"" >> fatSectionMonounsaturatedFatsExtractionScript.sh

touch fatSectionPolyunsaturatedFatsExtractionScript.sh
echo '#!/bin/bash' > fatSectionPolyunsaturatedFatsExtractionScript.sh
chmod u+x fatSectionPolyunsaturatedFatsExtractionScript.sh
echo "targetLocationToBeFiltered=\""./$extractionTargetFolderName/PolyunsaturatedFats.txt"\"" >> fatSectionPolyunsaturatedFatsExtractionScript.sh

touch fatSectionTransFatsExtractionScript.sh
echo '#!/bin/bash' > fatSectionTransFatsExtractionScript.sh
chmod u+x fatSectionTransFatsExtractionScript.sh
echo "targetLocationToBeFiltered=\""./$extractionTargetFolderName/TransFats.txt"\"" >> fatSectionTransFatsExtractionScript.sh

touch fatSectionPhytosterolsExtractionScript.sh
echo '#!/bin/bash' > fatSectionPhytosterolsExtractionScript.sh
chmod u+x fatSectionPhytosterolsExtractionScript.sh
echo "targetLocationToBeFiltered=\""./$extractionTargetFolderName/Phytosterols.txt"\"" >> fatSectionPhytosterolsExtractionScript.sh
