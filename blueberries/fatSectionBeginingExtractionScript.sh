#!/bin/bash
#now this script will search in his directory 
currentWorkingDirectory=$(pwd)
foodName=$1
targetLocationToBeFiltered=$(echo ${currentWorkingDirectory}/${foodName}"/fats/begining.txt")


# echo $targetLocationToBeFiltered

fileWithFilteredDataCsv=$(echo $targetLocationToBeFiltered | sed -E 's/\.txt/\.csv/')
fileWithMetricsCsv=$(echo $targetLocationToBeFiltered | sed -E 's/\.txt/\Metrics.csv/')

# header
sed -n '1~2'p < $targetLocationToBeFiltered | paste -sd ',' > $fileWithFilteredDataCsv

# value
sed -n '0~2'p < $targetLocationToBeFiltered | sed -E 's/[a-z]+//; s/--/null/' | paste -sd ',' >> $fileWithFilteredDataCsv

# metrics
sed -n '0~2'p < $targetLocationToBeFiltered | sed -E 's/[0-9]//g; s/--//; s/\.//; s/^$/ratio/' | paste -sd ',' > $fileWithMetricsCsv