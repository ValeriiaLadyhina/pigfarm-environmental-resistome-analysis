#!/bin/bash
#$ -N megahit
#$ -M valeriia.ladyhina@slu.se
#$ -m besa
#$ -t 1-61:1
#$ -tc 7
#$ -cwd
#$ -l h_rt=240:0:0,h_vmem=10G
#$ -pe smp 12
#$ -e /proj/pig_amresistance/NOBACKUP/logs/Main_Study/megahit/$JOB_NAME_$TASK_ID.err
#$ -o /proj/pig_amresistance/NOBACKUP/logs/Main_Study/megahit/$JOB_NAME_$TASK_ID.out

WORKING_DIR="/proj/pig_amresistance/NOBACKUP/Main_Study/bowtie2samtools"
OUTPUT_DIR="/proj/pig_amresistance/NOBACKUP/Main_Study/megahit"

# Get all R1 files into an array
R1_FILES=(${WORKING_DIR}/*_host_removed_R1.fastq)

# Get the file corresponding to the current task ID (1-indexed)
R1="${R1_FILES[$SGE_TASK_ID-1]}"
R2="${R1/_host_removed_R1.fastq/_host_removed_R2.fastq}"

#Extract sample name
SAMPLE=$(basename "$R1" _host_removed_R1.fastq)
OUT_PREFIX="${OUTPUT_DIR}/${SAMPLE}"

module load megahit

megahit\
 -1 "${R1}"\
 -2 "${R2}"\
 --presets meta-large\
 -o "${OUT_PREFIX}"
