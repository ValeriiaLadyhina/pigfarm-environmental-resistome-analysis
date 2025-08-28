#!/bin/bash
#$ -N fastp
#$ -M valeriia.ladyhina@slu.se
#$ -m besa
#$ -t 1-61:1
#$ -tc 6
#$ -cwd
#$ -l h_rt=10:0:0,h_vmem=5G
#$ -pe smp 4
#$ -e /proj/pig_amresistance/NOBACKUP/logs/Main_Study/fastp/$JOB_NAME_$TASK_ID.err
#$ -o /proj/pig_amresistance/NOBACKUP/logs/Main_Study/fastp/$JOB_NAME_$TASK_ID.out

# Load module
module load fastp

# Define input and output directories
WORKING_DIR="/proj/pig_amresistance/data/Main_Study"
OUTPUT_DIR="/proj/pig_amresistance/NOBACKUP/Main_Study/fastp"

# Get all R1 files into an array
R1_FILES=(${WORKING_DIR}/*_R1.fq.gz)

# Get the file corresponding to the current task ID (1-indexed)
R1="${R1_FILES[$SGE_TASK_ID-1]}"
R2="${R1/_R1.fq.gz/_R2.fq.gz}"

# Extract sample name
sample=$(basename "$R1" _R1.fq.gz)

# Output file names
output1="${OUTPUT_DIR}/${sample}_R1_trimmed.fq.gz"
output2="${OUTPUT_DIR}/${sample}_R2_trimmed.fq.gz"
html="${OUTPUT_DIR}/${sample}_fastp.html"
json="${OUTPUT_DIR}/${sample}_fastp.json"

# Run fastp
fastp \
  -i "$R1" -I "$R2" \
  -o "$output1" -O "$output2" \
  -q 20 -l 50 -g -w 4 \
  --adapter_sequence AATGATACGGCGACCACCGAGATCTACAC \
  --adapter_sequence_r2 GATCGGAAGAGCACACGTCTGAACTCCAGTCAC \
  --detect_adapter_for_pe \
  -h "$html" -j "$json"
