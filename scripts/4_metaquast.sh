#!/bin/bash
#$ -N metaquast
#$ -M valeriia.ladyhina@slu.se
#$ -m besa
#$ -t 1-1:1
#$ -tc 1
#$ -cwd
#$ -l h_rt=240:0:0,h_vmem=20G
#$ -pe smp 20
#$ -e /proj/pig_amresistance/NOBACKUP/logs/Main_Study/metaquast/$JOB_NAME_$TASK_ID.err
#$ -o /proj/pig_amresistance/NOBACKUP/logs/Main_Study/metaquast/$JOB_NAME_$TASK_ID.out

WORKING_DIR="/proj/pig_amresistance/NOBACKUP/Main_Study/megahit"
OUTPUT_DIR="/proj/pig_amresistance/NOBACKUP/Main_Study/metaquast/"
CONTIG_FOLDERS=(${WORKING_DIR}/*)

module load conda
. /opt/sw/conda/3/etc/profile.d/conda.sh
conda activate /export/home/valeriia/conda_env/metaquast

python /export/home/valeriia/conda_env/metaquast/opt/quast-5.2.0/metaquast.py\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F10_S3/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F10_S2/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F10_S4/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F1_S1/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F10_S5/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F10_S6/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F1_S2/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F1_S3/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F1_S4/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F1_S5/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F1_S6/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F10_S1/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F2_S1/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F2_S2/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F2_S3/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F2_S4/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F2_S5/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F2_S6/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F3_S1/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F3_S2/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F3_S3/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F3_S4/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F3_S5/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F3_S6/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F4_S1/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F4_S2/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F4_S4/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F4_S3/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F4_S6/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F4_S5/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F4_S7/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F5_S1/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F5_S2/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F5_S4/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F5_S3/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F5_S5/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F5_S6/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F6_S1/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F6_S2/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F6_S3/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F6_S4/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F6_S5/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F6_S6/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F7_S1/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F7_S2/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F7_S3/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F7_S4/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F7_S5/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F7_S6/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F8_S1/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F8_S2/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F8_S3/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F8_S4/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F8_S5/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F8_S6/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F9_S1/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F9_S2/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F9_S3/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F9_S4/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F9_S5/final.contigs.fa\
 /proj/pig_amresistance/NOBACKUP/Main_Study/megahit/F9_S6/final.contigs.fa\
 --references-list reference_list.txt\
 -o ${OUTPUT_DIR}
 -t 15\
 -l "F10_S3, F10_S2, F10_S4, F1_S1, F10_S5, F10_S6, F1_S2, F1_S3, F1_S4, F1_S5, F1_S6, F10_S1, F2_S1, F2_S2, F2_S3, F2_S4, F2_S5, F2_S6, F3_S1, F3_S2, F3_S3, F3_S4, F3_S5, F3_S6, F4_S1, F4_S2, F4_S4, F4_S3, F4_S6, F4_S5, F4_S7, F5_S1, F5_S2, F5_S4, F5_S3, F5_S5, F5_S6, F6_S1, F6_S2, F6_S3, F6_S4, F6_S5, F6_S6, F7_S1, F7_S2, F7_S3, F7_S4, F7_S5, F7_S6, F8_S1, F8_S2, F8_S3, F8_S4, F8_S5, F8_S6, F9_S1, F9_S2, F9_S3, F9_S4, F9_S5, F9_S6"\
 --circos
