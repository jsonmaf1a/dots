#!/bin/bash

count=$1

if [ -z "$1" ]; then
  echo "No count provided. Using '10'"

  count="10"
fi

for i in $(seq 1 $count); do
    noti send $i
done
