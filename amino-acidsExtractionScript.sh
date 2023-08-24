#!/bin/bash
#amino-acids extractions script

fileWithSourceRawDataFile=$1
pathDirectory=$2

extractionTarget="amino-acids"
extractionTargetFolderName=${pathDirectory}"amino-acids"

foodNameExtracted=$(pup 'span#longname text{}' < $fileWithSourceRawDataFile | sed 's/ //g')


fileWithFilteredDataCsv=$(echo ${pathDirectory}${foodNameExtracted}${extractionTarget}.csv | sed 's/ //g')
fileWithMetricsCsv=$(echo ${pathDirectory}${foodNameExtracted}${extractionTarget}"metrics.csv" | sed 's/ //g')


mkdir $extractionTargetFolderName 2> /dev/null

dataSelectorAndOption="div#${extractionTarget} text{}"


# 1:Essential Amino Acids
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 19 | tail -n +2 > $extractionTargetFolderName/EssentialAminoAcids.txt

# 20:Conditionally Essential Amino Acids
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 30 | tail -n 10 > $extractionTargetFolderName/ConditionallyEssentialAminoAcids.txt


# 31:Non-Essential Amino Acids
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '32~1'p > $extractionTargetFolderName/Non-EssentialAminoAcids.txt


cp ./EssentialAminoAcidsExtractionScript.sh ${pathDirectory}EssentialAminoAcidsExtractionScript.sh
# touch ${pathDirectory}EssentialAminoAcidsExtractionScript.sh
# echo '#!/bin/bash' > ${pathDirectory}EssentialAminoAcidsExtractionScript.sh
# chmod u+x ${pathDirectory}EssentialAminoAcidsExtractionScript.sh
# echo "targetLocationToBeFiltered=\""$extractionTargetFolderName/EssentialAminoAcids.txt"\"" >> ${pathDirectory}EssentialAminoAcidsExtractionScript.sh

cp ./ConditionallyEssentialAminoAcidsExtractionScript.sh ${pathDirectory}ConditionallyEssentialAminoAcidsExtractionScript.sh
# touch ${pathDirectory}ConditionallyEssentialAminoAcidsExtractionScript.sh
# echo '#!/bin/bash' > ${pathDirectory}ConditionallyEssentialAminoAcidsExtractionScript.sh
# chmod u+x ${pathDirectory}ConditionallyEssentialAminoAcidsExtractionScript.sh
# echo "targetLocationToBeFiltered=\""$extractionTargetFolderName/ConditionallyEssentialAminoAcids.txt"\"" >> ${pathDirectory}ConditionallyEssentialAminoAcidsExtractionScript.sh

cp ./Non-EssentialAminoAcidsExtractionScript.sh ${pathDirectory}Non-EssentialAminoAcidsExtractionScript.sh
# touch ${pathDirectory}Non-EssentialAminoAcidsExtractionScript.sh
# echo '#!/bin/bash' > ${pathDirectory}Non-EssentialAminoAcidsExtractionScript.sh
# chmod u+x ${pathDirectory}Non-EssentialAminoAcidsExtractionScript.sh
# echo "targetLocationToBeFiltered=\""$extractionTargetFolderName/Non-EssentialAminoAcids.txt"\"" >> ${pathDirectory}Non-EssentialAminoAcidsExtractionScript.sh