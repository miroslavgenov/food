#!/bin/bash
#Script to extract minerals

fileSourceRawDataFile=$(ls *.html)

extractionTarget="minerals"

foodNameExtracted=$(pup 'span#longname text{}' < $fileSourceRawDataFile | sed 's/ *//g')


fileWithFilteredDataCsv=$(echo "${foodNameExtracted}""${extractionTarget}".csv | sed 's/ *//g')
fileWithMetricsCsv=$(echo $foodNameExtracted$extractionTarget"metrics.csv" | sed 's/ *//g')
fileWithHeaderShortNames=$(echo "${foodNameExtracted}"FileWithHeaderShortNames.csv)

dataSelectorAndOption="div#${extractionTarget} text{}"

#header
pup $dataSelectorAndOption < $fileSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '1~2'p | sed -E 's/^[A-Z]{1}[a-z]+$/&,null/;s/ //' | cut -d ',' -f 1 | paste -sd ',' > $fileWithFilteredDataCsv

#header short names
pup $dataSelectorAndOption < $fileSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '1~2'p | sed -E 's/^[A-Z]{1}[a-z]+$/&,null/;s/ //' | cut -d ',' -f 2  | paste -sd ',' > $fileWithHeaderShortNames

#value extraction
pup $dataSelectorAndOption < $fileSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '0~2'p | sed -E 's/[a-z]*//g;s/--/null/' | paste -sd ',' >> $fileWithFilteredDataCsv

#metrics
pup $dataSelectorAndOption < $fileSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +5 | sed -n '0~2'p | sed -E 's/[0-9]*//g;s/\.//;s/-*//' | paste -sd ',' > $fileWithMetricsCsv