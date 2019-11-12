#!/bin/bash

# This tool splits FASTQ files by lane
# usage: separateFastqs.sh <input file>

INPUT_FASTQ=$1
FILENAME=$( basename "$INPUT_FASTQ" )

for LANE in {1..4}
    do
        NEW_FILENAME=$( echo "$INPUT_FASTQ" | sed -E """s/(S[0-9])_([IR][1-2])/\1_LOO"${LANE}"_\2/g""" )
        if [[ $INPUT_FASTQ == *"_Illumina_"* ]]; then
            zcat ${INPUT_FASTQ} | grep -A 3 \:$LANE\: | gzip > ${NEW_FILENAME}
        elif [[ $INPUT_FASTQ == *"_BGI_"* ]]; then
            zcat ${INPUT_FASTQ} | grep -A 3 L${LANE} | gzip > ${NEW_FILENAME}
        fi
    done
