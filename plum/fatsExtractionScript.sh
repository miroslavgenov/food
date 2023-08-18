#!/bin/bash
#fats extractions script

fileWithSourceRawDataFile=$(ls *.html)

extractionTarget="fats"
extractionTargetFolderName="fats"

foodNameExtracted=$(pup 'span#longname text{}' < $fileWithSourceRawDataFile | sed 's/ *//g')


fileWithFilteredDataCsv=$(echo "${foodNameExtracted}""${extractionTarget}".csv | sed 's/ *//g')
fileWithMetricsCsv=$(echo $foodNameExtracted$extractionTarget"metrics.csv" | sed 's/ *//g')

dataSelectorAndOption="div#${extractionTarget} text{}"

mkdir $extractionTargetFolderName

# section of the fat extraction 
# beggining
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 12 > ./$extractionTargetFolderName/beginFilterd.txt

# # Omega 3 Fats 
# pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 23 | tail -n 11

# # Omega-6 Fats
# pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 34 | tail -n 11

# # Saturated Fats
# pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 63 | tail -n 29

# # Monounsaturated Fats
# pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 88 | tail -n 25

# # Polyunsaturated Fats
# pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 109| tail -n 21

# # Trans Fats
# pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | head -n 124| tail -n 15

# # Phytosterols (Plant Sterols)
# pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '125~1'p
