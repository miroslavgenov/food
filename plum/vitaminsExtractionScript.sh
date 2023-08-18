#!/bin/bash
#vitamins extractions script


fileWithSourceRawDataFile=$(ls *.html)

extractionTarget="vitamins"

foodNameExtracted=$(pup 'span#longname text{}' < $fileWithSourceRawDataFile | sed 's/ *//g')


fileWithFilteredDataCsv=$(echo "${foodNameExtracted}""${extractionTarget}".csv | sed 's/ *//g')
fileWithMetricsCsv=$(echo $foodNameExtracted$extractionTarget"metrics.csv" | sed 's/ *//g')

dataSelectorAndOption="div#${extractionTarget} text{}"

# header extraction
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$"| tail -n +5 | sed -n '1~2'p | sed 's/(//;s/)//' | sed -E 's/[A-Z][a-z]+ B/Vitamin B/; s/ PA//; s/,//; s/\+/plus/; s/Biotin/Vitamin B7/' | paste -sd ',' > $fileWithFilteredDataCsv

# values extraction
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$"| tail -n +5 | sed -n '0~2'p | sed -E 's/[a-z]+//; s/[A-Z]+//; s/--/null/' | paste -sd ',' >> $fileWithFilteredDataCsv

# metrics extraction
pup $dataSelectorAndOption < $fileWithSourceRawDataFile | grep -vE "^ *$" | grep -vE "[0-9]*%$"| tail -n +5 | sed -n '0~2'p | sed -E 's/[0-9]//g; s/\.//; s/-//g' | paste -sd ',' > $fileWithMetricsCsv