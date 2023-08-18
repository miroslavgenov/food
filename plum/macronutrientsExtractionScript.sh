#!/bin/bash
#Macronutrients extractions script

fileWithRawData=$(ls ./*.html)
foodName=$(pup "span#longname text{}" < "${fileWithRawData}" | tr ',' ' '| grep -i "[a-z]")
macroNutrients="Macronutrients"
fileWithFilteredDataCsv=$(echo "${foodName}""${macroNutrients}".csv | sed 's/ *//g')
fileWithMetricsCsv=$(echo "${foodName}""${macroNutrients}"metrics.csv | sed 's/ *//g')





sectionSelectorAndOption="div#${macroNutrients} text{}"

# extracting the header
sectionHeader=$(pup $sectionSelectorAndOption < "${fileWithRawData}" | grep -v "%" | grep -Ei '^[a-z0-9-]' | tail -n +2 | sed -n '1~2'p | sed 's/-//;s/ //g' | paste -sd ',')
echo "FoodName,"$sectionHeader > $fileWithFilteredDataCsv

# extracting the values
sectionValues=$(pup $sectionSelectorAndOption < "${fileWithRawData}" | grep -v "%" | grep -Ei '^[a-z0-9-]' | tail -n +2 | sed -n '0~2'p | sed -E 's/[a-z]//g' | paste -sd ',')
foodName=$(echo $foodName | sed 's/^ *//')
echo "${foodName},"$sectionValues >> $fileWithFilteredDataCsv

# extractiong the metrics of the values
sectionMetrics=$(pup $sectionSelectorAndOption < "${fileWithRawData}" | grep -v "%" | grep -Ei '^[a-z0-9-]' | tail -n +2 | sed -n '0~2'p | sed '2s/$/cal/' | sed 's/\.//' | sed -E 's/[0-9]//g' | paste -sd ',')
echo "string,"$sectionMetrics > $fileWithMetricsCsv