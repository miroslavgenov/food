#!/bin/bash
currentWorkingDirectory=$(pwd)
foodName=$1
targetLocationToBeFiltered=$(echo ${currentWorkingDirectory}/${foodName}"/amino-acids/ConditionallyEssentialAminoAcids.txt")


fileWithFilteredDataCsv=$(echo $targetLocationToBeFiltered | sed -E 's/\.txt/\.csv/')
fileWithMetricsCsv=$(echo $targetLocationToBeFiltered | sed -E 's/\.txt/\Metrics.csv/')

# echo $targetLocationToBeFiltered
# echo $fileWithFilteredDataCsv
# echo $fileWithMetricsCsv

# cat $targetLocationToBeFiltered


# header
sed -n '1~2'p < $targetLocationToBeFiltered | paste -sd ',' > $fileWithFilteredDataCsv

# # value
sed -n '0~2'p < $targetLocationToBeFiltered | sed -E 's/[a-z]+//; s/--/null/' | paste -sd ',' >> $fileWithFilteredDataCsv

# # metrics
sed -n '0~2'p < $targetLocationToBeFiltered | sed -E 's/[0-9]+//g; s/\.//; s/--//' | paste -sd ',' > $fileWithMetricsCsv