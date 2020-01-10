#!/bin/bash
# IMPORTANT PATHS
CWD=`dirname $0`
CELLRANGER_PATH=/shares/powell/pipelines/cellranger-2.2.0
OUTPUT_DIR=/shares/powell/data/experimental_data/CLEAN/BGISeq_scRNA
INPUT_CSV=${CWD}/iPSC.csv

### SET UP ENVIRONMENT
export PATH=${CELLRANGER_PATH}:$PATH
source ${CELLRANGER_PATH}/sourceme.bash

# Run cellranger count
cd $OUTPUT_DIR
cellranger aggr --id=iPSC --csv=${INPUT_CSV} --normalize=raw --nosecondary
