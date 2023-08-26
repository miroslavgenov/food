#!/bin/bash
currentWorkingDirectory=$(pwd)
foodName=$1
targetLocationToBeFiltered=$(echo ${currentWorkingDirectory}/${foodName}"/fats/MonounsaturatedFats.txt")


fileWithFilteredDataCsv=$(echo $targetLocationToBeFiltered | sed -E 's/\.txt/\.csv/')
fileWithMetricsCsv=$(echo $targetLocationToBeFiltered | sed -E 's/\.txt/\Metrics.csv/')


# header
tail -n +2 < $targetLocationToBeFiltered | sed -n '1~2'p | sed -E 's/[a-z]+$/& (:)/; s/acid/Acid/' | cut -d '(' -f 1 | sed 's/ $//' | paste -sd ',' > $fileWithFilteredDataCsv

# value
tail -n +2 < $targetLocationToBeFiltered| sed -n '0~2'p | sed -E 's/[a-z]+//; s/--/null/' | paste -sd ',' >> $fileWithFilteredDataCsv

# metrics
tail -n +2 < $targetLocationToBeFiltered | sed -n '0~2'p | sed -E 's/[0-9]+//g; s/\.//; s/--//' | paste -sd ',' > $fileWithMetricsCsv