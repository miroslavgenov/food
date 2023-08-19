#!/bin/bash
targetLocationToBeFiltered="./fats/Omega-6Fats.txt"
fileWithFilteredDataCsv=$(echo $targetLocationToBeFiltered | sed -E 's/\.txt/\.csv/')
fileWithMetricsCsv=$(echo $targetLocationToBeFiltered | sed -E 's/\.txt/\Metrics.csv/')

# echo $targetLocationToBeFiltered
# echo $fileWithFilteredDataCsv
# echo $fileWithMetricsCsv

# header
tail -n +2 < $targetLocationToBeFiltered | sed -n '1~2'p | cut -d '(' -f 1 | sed -E 's/[a|A]cid /Acid/' |  paste -sd ',' > $fileWithFilteredDataCsv

# value
tail -n +2 < $targetLocationToBeFiltered| sed -n '0~2'p | sed -E 's/[a-z]+//; s/--/null/' | paste -sd ',' >> $fileWithFilteredDataCsv

# metrics
tail -n +2 < $targetLocationToBeFiltered | sed -n '0~2'p | sed -E 's/[0-9]+//g; s/\.//; s/--//'  | paste -sd ',' > $fileWithMetricsCsv