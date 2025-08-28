#!/bin/bash
#$ -N kaiju_db_build
#$ -M valeriia.ladyhina@slu.se;
#$ -m besa # this is what notification you want to receive about the job on your mail (start ; end ; error ; killed)
#$ -cwd #Use the directory you're running from
#$ -l h_rt=240:0:0,h_vmem=15G
#Setting running time in hours:min:sec and the memory required for the job per cpus (12*2=24g of RAM)
#$ -pe smp 32 #Setting the number of threads for the job to best fit for the system between 1 and 48.
#$ -e /proj/pig_amresistance/NOBACKUP/logs/Main_Study/kaiju/kaiju_db_build.err
#$ -o /proj/pig_amresistance/NOBACKUP/logs/Main_Study/kaiju/kaiju_db_build.out
module load conda
. /opt/sw/conda/3/etc/profile.d/conda.sh
conda activate /home/valeriia/conda_env/kaiju_env

mkdir kaijudb
cd kaijudb
kaiju-makedb -s refseq_nr
