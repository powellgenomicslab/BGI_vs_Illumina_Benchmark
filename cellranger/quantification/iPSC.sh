#!/bin/bash

# IMPORTANT PATHS
INPUT_DIR=/shares/powell/data/experimental_data/RAW/BGISeq_scRNA/iPSC
CELLRANGER_PATH=/shares/powell/pipelines/cellranger-2.2.0
REF_PATH=/shares/powell/data/reference_data/cellranger-2.0.0/Homo_sapiens.GRCh38p10/Homo_sapiens_GRCh38p10
OUTPUT_DIR=/shares/powell/data/experimental_data/CLEAN/BGISeq_scRNA

### SET UP ENVIRONMENT
export PATH=${CELLRANGER_PATH}:$PATH
source ${CELLRANGER_PATH}/sourceme.bash

### GO TO OUTPUT DIRECTORY - THIS NEEDS TO EXIST
cd $OUTPUT_DIR

### RUN CELL RANGER
time cellranger count --id=iPSC_Illumina --sample=iPSC_Illumina --fastqs=${INPUT_DIR} --localmem=126 --localcores=8 --transcriptome=${REF_PATH} --nosecondary --expect-cells 10000 --chemistry threeprime
time cellranger count --id=iPSC_BGI --sample=iPSC_BGI_AAGACGGA,iPSC_BGI_CGAGGCTC,iPSC_BGI_GTCCTTCT,iPSC_BGI_TCTTAAAG --fastqs=${INPUT_DIR} --localmem=126 --localcores=8 --transcriptome=${REF_PATH} --nosecondary --expect-cells 10000 --chemistry threeprime
time cellranger count --id=iPSC_BGI_98bp --sample=iPSC_BGI_AAGACGGA,iPSC_BGI_CGAGGCTC,iPSC_BGI_GTCCTTCT,iPSC_BGI_TCTTAAAG --fastqs=${INPUT_DIR} --localmem=126 --localcores=8 --transcriptome=${REF_PATH} --nosecondary --expect-cells 10000 --chemistry threeprime --r2-length 98