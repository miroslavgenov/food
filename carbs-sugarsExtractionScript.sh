#!/bin/bash
#carbs-sugars extractions script

fileWithSourceRawDataFile=$1
pathDirectory=$2

extractionTarget="carbs-sugars"

foodNameExtracted=$(pup 'span#longname text{}' < $fileWithSourceRawDataFile | sed 's/ //g')

# echo $foodNameExtracted

fileWithFilteredDataCsv=$(echo ${pathDirectory}${foodNameExtracted}${extractionTarget}.csv | sed 's/ //g')
fileWithMetricsCsv=$(echo ${pathDirectory}${foodNameExtracted}${extractionTarget}"metrics.csv" | sed 's/ //g')

dataSelectorAndOption="div#${extractionTarget} text{}"

# header extraction
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '1~2'p | sed -E 's/\(//; s/\)//; s/,//' | paste -sd ',' > $fileWithFilteredDataCsv

#value extraction
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '0~2'p | sed -E 's/[a-z]+//; s/--/null/' | paste -sd ',' >> $fileWithFilteredDataCsv

#metrics extraction
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '0~2'p | sed -E 's/[0-9]+//g; s/--//; s/\.//' | paste -sd ',' > $fileWithMetricsCsv