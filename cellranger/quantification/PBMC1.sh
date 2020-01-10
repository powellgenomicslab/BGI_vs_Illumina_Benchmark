#!/bin/bash

# IMPORTANT PATHS
INPUT_DIR=/shares/powell/data/experimental_data/RAW/BGISeq_scRNA/PBMC1
CELLRANGER_PATH=/shares/powell/pipelines/cellranger-2.2.0
REF_PATH=/shares/powell/data/reference_data/cellranger-2.0.0/Homo_sapiens.GRCh38p10/Homo_sapiens_GRCh38p10
OUTPUT_DIR=/shares/powell/data/experimental_data/CLEAN/BGISeq_scRNA

### SET UP ENVIRONMENT
export PATH=${CELLRANGER_PATH}:$PATH
source ${CELLRANGER_PATH}/sourceme.bash

### RUN CELL RANGER
time cellranger count --id=PBMC1_Illumina --sample=PBMC1_Illumina_ACCCTCCT,PBMC1_Illumina_CAAGGGAG,PBMC1_Illumina_GTTGCAGC,PBMC1_Illumina_TGGAATTA \
--fastqs=${INPUT_DIR} --localmem=126 --localcores=8 --transcriptome=${REF_PATH} --nosecondary --expect-cells 20000 --chemistry threeprime

### RUN CELL RANGER
time cellranger count --id=PBMC1_BGI --sample=PBMC1_BGI_ACCCTCCT,PBMC1_BGI_CAATGGAG,PBMC1_BGI_GTTGCAGC,PBMC1_BGI_TGGAATTA \
--fastqs=${INPUT_DIR} --localmem=126 --localcores=8 --transcriptome=${REF_PATH} --nosecondary --expect-cells 20000 --chemistry threeprime 

time cellranger count --id=PBMC1_BGI_98bp --sample=PBMC1_BGI_ACCCTCCT,PBMC1_BGI_CAATGGAG,PBMC1_BGI_GTTGCAGC,PBMC1_BGI_TGGAATTA \
--fastqs=${INPUT_DIR} --localmem=126 --localcores=8 --transcriptome=${REF_PATH} --nosecondary --expect-cells 20000 --chemistry threeprime --r2-length 98
