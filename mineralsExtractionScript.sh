#!/bin/bash
#Script to extract minerals


fileSourceRawDataFile=$1
pathDirectory=$2 

# echo $fileSourceRawDataFile
# echo $pathDirectory

extractionTarget="minerals"

foodNameExtracted=$(pup 'span#longname text{}' < $fileSourceRawDataFile | sed 's/ //g')

fileWithFilteredDataCsv=$(echo  "${pathDirectory}""${foodNameExtracted}""${extractionTarget}".csv | sed 's/ //g' | paste -sd '')
fileWithMetricsCsv=$(echo "${pathDirectory}"$foodNameExtracted$extractionTarget"metrics.csv" | sed 's/ //g' | paste -sd '')
fileWithHeaderShortNames=$(echo "${pathDirectory}""${foodNameExtracted}FileWithHeaderShortNames.csv" | sed 's/ //g' | paste -sd '')


dataSelectorAndOption="div#${extractionTarget} text{}"


# #header
pup $dataSelectorAndOption < $fileSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '1~2'p | sed -E 's/^[A-Z]{1}[a-z]+$/&,null/;s/ //' | cut -d ',' -f 1 | paste -sd ',' > $fileWithFilteredDataCsv

# #header short names
pup $dataSelectorAndOption < $fileSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '1~2'p | sed -E 's/^[A-Z]{1}[a-z]+$/&,null/;s/ //' | cut -d ',' -f 2  | paste -sd ',' > $fileWithHeaderShortNames

# #value extraction
pup $dataSelectorAndOption < $fileSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '0~2'p | sed -E 's/[a-z]*//g;s/--/null/' | paste -sd ',' >> $fileWithFilteredDataCsv

# #metrics
pup $dataSelectorAndOption < $fileSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '0~2'p | sed -E 's/[0-9]*//g;s/\.//;s/-*//' | paste -sd ',' > $fileWithMetricsCsv
