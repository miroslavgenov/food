#!/bin/bash
#Macronutrients extractions script

fileSourceRawDataFile=$1
pathDirectory=$2

# echo $fileSourceRawDataFile
# echo $pathDirectory

foodNameExtracted=$(pup "span#longname text{}" < "${fileSourceRawDataFile}" | tr ',' ' '| grep -i "[a-z]")
extractionTarget="Macronutrients"



fileWithFilteredDataCsv=$(echo "${pathDirectory}${foodNameExtracted}${extractionTarget}.csv" | sed 's/ //g')
fileWithMetricsCsv=$(echo "${pathDirectory}""${foodNameExtracted}"${extractionTarget}"metrics.csv" | sed 's/ //g' )


fileWithFilteredDataCsv=$(echo $fileWithFilteredDataCsv | sed -E 's/ //g')
fileWithMetricsCsv=$(echo $fileWithMetricsCsv | sed -E 's/ //g')

# echo $fileWithFilteredDataCsv
# echo $fileWithMetricsCsv


dataSelectorAndOption="div#${extractionTarget} text{}"

# extracting the header
sectionHeader=$(pup $dataSelectorAndOption < "${fileSourceRawDataFile}" | grep -v "%" | grep -Ei '^[a-z0-9-]' | tail -n +2 | sed -n '1~2'p | sed 's/-//;s/ //g' | paste -sd ',')
echo "FoodName,"$sectionHeader > $fileWithFilteredDataCsv

# extracting the values
sectionValues=$(pup $dataSelectorAndOption < "${fileSourceRawDataFile}" | grep -v "%" | grep -Ei '^[a-z0-9-]' | tail -n +2 | sed -n '0~2'p | sed -E 's/[a-z]//g' | paste -sd ',')
foodNameExtracted=$(echo $foodNameExtracted | sed 's/^ *//')
echo "${foodNameExtracted},"$sectionValues >> $fileWithFilteredDataCsv

# extractiong the metrics of the values
sectionMetrics=$(pup $dataSelectorAndOption < "${fileSourceRawDataFile}" | grep -v "%" | grep -Ei '^[a-z0-9-]' | tail -n +2 | sed -n '0~2'p | sed '2s/$/cal/' | sed 's/\.//' | sed -E 's/[0-9]//g' | paste -sd ',')
echo "string,"$sectionMetrics > $fileWithMetricsCsv