#!/bin/bash
# Sample name
FASTQ_FILE=$1
PLATFORM=$2

function split_fastq {
# LOOP OVER EACH LANE
    for LANE in 1..4
    do
        zcat ${SAMPLE}_I1_001.fastq.gz | grep -A 3 \:$LANE\: | gzip > ${SAMPLE}_L00${LANE}_I1_001.fastq.gz
        zcat ${SAMPLE}_R1_001.fastq.gz | grep -A 3 \:$LANE\: | gzip > ${SAMPLE}_L00${LANE}_R1_001.fastq.gz
        zcat ${SAMPLE}_R2_001.fastq.gz | grep -A 3 \:$LANE\: | gzip > ${SAMPLE}_L00${LANE}_R2_001.fastq.gz
    done
}

if [[  $PLATFORM == "Illumina" ]]; then
    grep_expression="grep -A 3 \:1\:"
elif [[ $SAMPLE == "BGI" ]]; then
    grep_expression="grep -A 3 \:1\:"
fi

