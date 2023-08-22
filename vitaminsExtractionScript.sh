#!/bin/bash
#vitamins extractions script


fileWithSourceRawDataFile=$1
pathDirectory=$2

extractionTarget="vitamins"

foodNameExtracted=$(pup 'span#longname text{}' < $fileWithSourceRawDataFile | sed 's/ *//g')

fileWithFilteredDataCsv=$(echo "${pathDirectory}${foodNameExtracted}${extractionTarget}.csv")
fileWithMetricsCsv=$(echo "${pathDirectory}""${foodNameExtracted}"${extractionTarget}"metrics.csv")

fileWithFilteredDataCsv=$(echo $fileWithFilteredDataCsv | sed -E 's/ //g')
fileWithMetricsCsv=$(echo $fileWithMetricsCsv | sed -E 's/ //g')


dataSelectorAndOption="div#${extractionTarget} text{}"

# header extraction
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$"| tail -n +5 | sed -n '1~2'p | sed 's/(//;s/)//' | sed -E 's/[A-Z][a-z]+ B/Vitamin B/; s/ PA//; s/,//; s/\+/plus/; s/Biotin/Vitamin B7/' | paste -sd ',' > $fileWithFilteredDataCsv

# values extraction
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$"| tail -n +5 | sed -n '0~2'p | sed -E 's/[a-z]+//; s/[A-Z]+//; s/--/null/' | paste -sd ',' >> $fileWithFilteredDataCsv

# metrics extraction
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$"| tail -n +5 | sed -n '0~2'p | sed -E 's/[0-9]//g; s/\.//; s/-//g' | paste -sd ',' > $fileWithMetricsCsv