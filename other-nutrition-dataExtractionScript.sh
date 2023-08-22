#!/bin/bash
#other-nutrition-data extractions script

fileWithSourceRawDataFile=$(ls *.html)

extractionTarget="other-nutrition-data"

foodNameExtracted=$(pup 'span#longname text{}' < $fileWithSourceRawDataFile | sed 's/ *//g')


fileWithFilteredDataCsv=$(echo "${foodNameExtracted}""${extractionTarget}".csv | sed 's/ *//g')
fileWithMetricsCsv=$(echo $foodNameExtracted$extractionTarget"metrics.csv" | sed 's/ *//g')

dataSelectorAndOption="div#${extractionTarget} text{}"

# header extraction
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +4 | sed -n '1~2'p | sed 's/ //' | paste -sd ',' > $fileWithFilteredDataCsv

# value extraction
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +4 | sed -n '0~2'p | sed -E 's/[a-z]+//' | paste -sd ',' >> $fileWithFilteredDataCsv

# metrics extraction
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$" | tail -n +4 | sed -n '0~2'p | sed -E 's/[0-9]//g; s/\.//; s/-/score/' | paste -sd ',' > $fileWithMetricsCsv