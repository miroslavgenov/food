#!/bin/bash

fileWithRawData=$(ls ./*.html)
foodName=$(pup "span#longname text{}" < "${fileWithRawData}" | tr ',' ' '| grep -i "[a-z]")

sectionsWithData=("Macronutrients" "minerals" "vitamins" "other-nutrition-data" "carbs-sugars")

section_fat="fats"
section_amino="amino-acids"



sectionSelectorAndOption="div#${sectionsWithData[0]} text{}"

fileWithFilteredDataCsv=$(echo "${foodName}""${sectionsWithData[$i]}".csv | sed 's/ *//g')
fileWithMetricsCsv=$(echo "${sectionsWithData[0]}"Metrics.csv | sed 's/ *//g')

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

