#!/bin/bash
# IMPORTANT PATHS
CWD=`dirname $0`
CELLRANGER_PATH=/shares/powell/pipelines/cellranger-2.2.0
OUTPUT_DIR=/shares/powell/data/experimental_data/CLEAN/BGISeq_scRNA
INPUT_CSV=${CWD}/PBMC1.csv

### SET UP ENVIRONMENT
export PATH=${CELLRANGER_PATH}:$PATH
source ${CELLRANGER_PATH}/sourceme.bash

### GO TO OUTPUT DIRECTORY - THIS NEEDS TO EXIST
cd $OUTPUT_DIR
time cellranger aggr --id=PBMC1 --csv=$INPUT_CSV --normalize=raw --nosecondary
