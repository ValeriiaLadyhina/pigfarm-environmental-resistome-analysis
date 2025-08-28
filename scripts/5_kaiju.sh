#!/bin/bash
#$ -N kaiju
#$ -M valeriia.ladyhina@slu.se
#$ -m besa # this is what notification you want to receive about the job on your mail (start ; end ; error ; killed)
#$ -t 1-3:1 #sets the task array
#$ -tc 5
#$ -cwd #Use the directory you're running from
#$ -l h_rt=240:0:0,h_vmem=25G
#Setting running time in hours:min:sec and the memory required for the job per cpus (12*2=24g of RAM)
#$ -pe smp 8  #Setting the number of threads for the job to best fit for the system between 1 and 48.
#$ -e /proj/pig_amresistance/NOBACKUP/logs/Main_Study/kaiju/$JOB_NAME_$TASK_ID.err
#$ -o /proj/pig_amresistance/NOBACKUP/logs/Main_Study/kaiju/$JOB_NAME_$TASK_ID.out


WORKING_DIR="/proj/pig_amresistance/NOBACKUP/Main_Study/bowtie2samtools/"
OUTPUT_DIR="/proj/pig_amresistance/NOBACKUP/Main_Study/kaiju/results"
R1_FILES=(${WORKING_DIR}/*_host_removed_R1.fastq)
R1="${R1_FILES[$SGE_TASK_ID-1]}"
R2="${R1/_host_removed_R1.fastq/_host_removed_R2.fastq}"
sample=$(basename "$R1" _host_removed_R1.fastq)


module load conda
. /opt/sw/conda/3/etc/profile.d/conda.sh
conda activate /home/valeriia/conda_env/kaiju_env

date +"%T"
kaiju -z 8 -t /proj/pig_amresistance/scripts/pipeline_scripts/kaijudb/nodes.dmp -f /proj/pig_amresistance/scripts/pipeline_scripts/kaijudb/refseq_nr/kaiju_db_refseq_nr.fmi -i "${R1}" -j "${R2}" -o "${OUTPUT_DIR}/${sample}_kaiju.out" -x -v

if [[ -s "${OUTPUT_DIR}/${sample}_kaiju.out" ]]; then
    echo "Kaiju output generated successfully."
else
    echo "Kaiju output file is missing or empty!"
fi
date +"%T"

