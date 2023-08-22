#!/bin/bash
#amino-acids extractions script

fileWithSourceRawDataFile=$(ls *.html)

extractionTarget="amino-acids"
extractionTargetFolderName="amino-acids"

foodNameExtracted=$(pup 'span#longname text{}' < $fileWithSourceRawDataFile | sed 's/ *//g')


fileWithFilteredDataCsv=$(echo "${foodNameExtracted}""${extractionTarget}".csv | sed 's/ *//g')
fileWithMetricsCsv=$(echo $foodNameExtracted$extractionTarget"metrics.csv" | sed 's/ *//g')

# echo $fileWithFilteredDataCsv
# echo $fileWithMetricsCsv

mkdir $extractionTargetFolderName

dataSelectorAndOption="div#${extractionTarget} text{}"


# 1:Essential Amino Acids
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 19 | tail -n +2 > ./$extractionTargetFolderName/EssentialAminoAcids.txt

# 20:Conditionally Essential Amino Acids
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 30 | tail -n 10 > ./$extractionTargetFolderName/ConditionallyEssentialAminoAcids.txt


# 31:Non-Essential Amino Acids
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '32~1'p > ./$extractionTargetFolderName/Non-EssentialAminoAcids.txt



touch EssentialAminoAcidsExtractionScript.sh
echo '#!/bin/bash' > EssentialAminoAcidsExtractionScript.sh
chmod u+x EssentialAminoAcidsExtractionScript.sh
echo "targetLocationToBeFiltered=\""./$extractionTargetFolderName/EssentialAminoAcids.txt"\"" >> EssentialAminoAcidsExtractionScript.sh

touch ConditionallyEssentialAminoAcidsExtractionScript.sh
echo '#!/bin/bash' > ConditionallyEssentialAminoAcidsExtractionScript.sh
chmod u+x ConditionallyEssentialAminoAcidsExtractionScript.sh
echo "targetLocationToBeFiltered=\""./$extractionTargetFolderName/ConditionallyEssentialAminoAcids.txt"\"" >> ConditionallyEssentialAminoAcidsExtractionScript.sh

touch Non-EssentialAminoAcidsExtractionScript.sh
echo '#!/bin/bash' > Non-EssentialAminoAcidsExtractionScript.sh
chmod u+x Non-EssentialAminoAcidsExtractionScript.sh
echo "targetLocationToBeFiltered=\""./$extractionTargetFolderName/Non-EssentialAminoAcids.txt"\"" >> Non-EssentialAminoAcidsExtractionScript.sh