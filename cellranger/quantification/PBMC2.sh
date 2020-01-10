#!/bin/bash

# IMPORTANT PATHS
INPUT_DIR=/shares/powell/data/experimental_data/RAW/BGISeq_scRNA/PBMC2
CELLRANGER_PATH=/shares/powell/pipelines/cellranger-2.2.0
REF_PATH=/shares/powell/data/reference_data/cellranger-2.0.0/Homo_sapiens.GRCh38p10/Homo_sapiens_GRCh38p10
OUTPUT_DIR=/shares/powell/data/experimental_data/CLEAN/BGISeq_scRNA

### SET UP ENVIRONMENT
export PATH=${CELLRANGER_PATH}:$PATH
source ${CELLRANGER_PATH}/sourceme.bash

### RUN CELL RANGER
time cellranger count --id=PBMC2_Illumina --sample=PBMC2_Illumina_ACGCGGGT,PBMC2_Illumina_CGCGATAC,PBMC2_Illumina_GAATTCCA,PBMC2_Illumina_TTTACATG \
--fastqs=${INPUT_DIR} --localmem=126 --localcores=8 --transcriptome=${REF_PATH} --nosecondary --expect-cells 20000 --chemistry threeprime

time cellranger count --id=PBMC2_BGI --sample=PBMC2_Illumina_ACGCGGGT,PBMC2_Illumina_CGCGATAC,PBMC2_Illumina_GAATTCCA,PBMC2_Illumina_TTTACATG \
--fastqs=${INPUT_DIR} --localmem=126 --localcores=8 --transcriptome=${REF_PATH} --nosecondary --expect-cells 20000 --chemistry threeprime

time cellranger count --id=PBMC2_BGI_98bp --sample=PBMC2_BGI_ACGCGGGT,PBMC2_BGI_CGCGATAC,PBMC2_BGI_GAATTCCA,PBMC2_BGI_TTTACATG \
--fastqs=${INPUT_DIR} --localmem=126 --localcores=8 --transcriptome=${REF_PATH} --nosecondary --expect-cells 20000 --chemistry threeprime --r2-length 98

