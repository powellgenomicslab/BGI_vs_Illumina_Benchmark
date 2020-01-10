#!/bin/bash

# IMPORTANT PATHS
INPUT_DIR=/shares/powell/data/experimental_data/RAW/BGISeq_scRNA/TMWC
REF_PATH=/shares/powell/data/reference_data/cellranger-2.0.0/Chromium_CROP-seq/GRCh38p10Spiked
OUTPUT_DIR=/shares/powell/data/experimental_data/CLEAN/BGISeq_scRNA

### SET UP ENVIRONMENT
export PATH=${CELLRANGER_PATH}:$PATH
source ${CELLRANGER_PATH}/sourceme.bash

cd $OUTPUT_DIR

### RUN CELL RANGER
time cellranger count --id=TMWC_Illumina --sample=TMWC_Illumina --fastqs=${INPUT_DIR} --localmem=126 --localcores=8 --transcriptome=${REF_PATH} --nosecondary --expect-cells 10000 --chemistry threeprime
time cellranger count --id=TMWC_BGI --sample=TMWC_BGI_ATTCCGAT,TMWC_BGI_CCCTAACA,TMWC_BGI_GAAGGCTG,TMWC_BGI_TGGATTGC --fastqs=${INPUT_DIR} --localmem=126 --localcores=8 --transcriptome=${REF_PATH} --nosecondary --expect-cells 10000 --chemistry threeprime
time cellranger count --id=TMWC_BGI_98bp --sample=TMWC_BGI_ATTCCGAT,TMWC_BGI_CCCTAACA,TMWC_BGI_GAAGGCTG,TMWC_BGI_TGGATTGC --fastqs=${INPUT_DIR} --localmem=126 --localcores=8 --transcriptome=${REF_PATH} --nosecondary --expect-cells 10000 --chemistry threeprime --r2-length 98