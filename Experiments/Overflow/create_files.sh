#!/bin/bash

prefix="Overflow_Underflow_"

start=1
end=53

for i in $(seq -f "%03g" $start $end); do
  folder_name="${prefix}${i}"
  mkdir -p "$folder_name"
  echo "Created folder: $folder_name"
done

echo "All folders created successfully."
