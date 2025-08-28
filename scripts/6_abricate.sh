#!/bin/bash
#$ -N abricate
#$ -M valeriia.ladyhina@slu.se
#$ -m besa
#$ -t 1-61:1
#$ -tc 10
#$ -cwd
#$ -l h_rt=240:0:0,h_vmem=5G
#$ -pe smp 2
#$ -e /proj/pig_amresistance/NOBACKUP/logs/Main_Study/abricate/$JOB_NAME_$TASK_ID.err
#$ -o /proj/pig_amresistance/NOBACKUP/logs/Main_Study/abricate/$JOB_NAME_$TASK_ID.out

# -------------------------------
# Activate conda environment
# -------------------------------
module load conda
. /opt/sw/conda/3/etc/profile.d/conda.sh
conda activate /home/valeriia/conda_env/abricate

# -------------------------------
# Define input/output
# -------------------------------
SAMPLE_DIR_BASE="/proj/pig_amresistance/NOBACKUP/Main_Study/megahit"
OUTPUT_DIR="/proj/pig_amresistance/NOBACKUP/Main_Study/abricate"


# Construct folder name for this task
FOLDER=(${SAMPLE_DIR_BASE}/*)
INPUT_FILE="${FOLDER[$SGE_TASK_ID-1]}/final.contigs.fa"

# -------------------------------
# Output CSVs (shared across tasks)
# -------------------------------
ARGANNOT_CSV="${OUTPUT_DIR}/argannot_results.csv"
CARD_CSV="${OUTPUT_DIR}/card_results.csv"
NCBI_CSV="${OUTPUT_DIR}/ncbi_results.csv"
RESFINDER_CSV="${OUTPUT_DIR}/resfinder_results.csv"
MEGARES_CSV="${OUTPUT_DIR}/megares_results.csv"

abricate --db argannot   "$INPUT_FILE" --csv >> "$ARGANNOT_CSV"
abricate --db card       "$INPUT_FILE" --csv >> "$CARD_CSV"
abricate --db ncbi       "$INPUT_FILE" --csv >> "$NCBI_CSV"
abricate --db resfinder  "$INPUT_FILE" --csv >> "$RESFINDER_CSV"
abricate --db megares    "$INPUT_FILE" --csv >> "$MEGARES_CSV"
