#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=$2
ATTACH_SEQ=$3

zcat $INPUT_FILE | awk -v var="$ATTACH_SEQ" '{if (NR%4 == 1){print $1"_"var} else{print $1}}' | gzip > $OUTPUT_FILE