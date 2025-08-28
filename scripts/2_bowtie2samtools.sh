#!/bin/bash
#$ -N bowtie2_host_mapping
#$ -M valeriia.ladyhina@slu.se
#$ -m besa
#$ -t 1-61:1
#$ -tc 10
#$ -cwd
#$ -l h_rt=240:0:0,h_vmem=10G
#$ -pe smp 8
#$ -e /proj/pig_amresistance/NOBACKUP/logs/Main_Study/bowtie2samtools/$JOB_NAME_$TASK_ID.err
#$ -o /proj/pig_amresistance/NOBACKUP/logs/Main_Study/bowtie2samtools/$JOB_NAME_$TASK_ID.out


# Directories
WORKING_DIR="/proj/pig_amresistance/NOBACKUP/Main_Study/fastp"
OUTPUT_DIR="/proj/pig_amresistance/NOBACKUP/Main_Study/bowtie2samtools/"
REF_INDEX="/proj/pig_amresistance/NOBACKUP/reference_genomes/Sscrofa11.1/Sscrofa11.1"

# Get all R1 files into an array
R1_FILES=(${WORKING_DIR}/*_R1_trimmed.fq.gz)

# Get the file corresponding to the current task ID (1-indexed)
R1="${R1_FILES[$SGE_TASK_ID-1]}"
R2="${R1/_R1_trimmed.fq.gz/_R2_trimmed.fq.gz}"

#Extract sample name
SAMPLE=$(basename "$R1" _R1_trimmed.fq.gz)
OUT_PREFIX="${OUTPUT_DIR}/${SAMPLE}"

echo "$(date +"%T") | R1: $R1"
echo "$(date +"%T") | R2: $R2"
echo "$(date +"%T") | OUT_PREFIX: $OUT_PREFIX"
echo "$(date +"%T") | OUT_PREFIX_m_and_um: ${OUT_PREFIX}_mapped_and_unmapped.sam"
# Load environment
module load conda
. /opt/sw/conda/3/etc/profile.d/conda.sh
conda activate /home/valeriia/conda_env/bowtie2_env
module load samtools

# Bowtie2 mapping
echo "$(date +"%T") | Starting Bowtie2 mapping for $SAMPLE"
bowtie2 -p 8 -x "$REF_INDEX" -1 "${R1}" -2 "${R2}" -S "${OUT_PREFIX}_mapped_and_unmapped.sam"

# Convert to BAM
echo "$(date +"%T") | Converting to BAM for $SAMPLE"
samtools view -bS "${OUT_PREFIX}_mapped_and_unmapped.sam" > "${OUT_PREFIX}_mapped_and_unmapped.bam"

# Extract both unmapped reads
echo "$(date +"%T") | Extracting of unmapped reads for $SAMPLE"
samtools view -b -f 12 -F 256 "${OUT_PREFIX}_mapped_and_unmapped.bam" > "${OUT_PREFIX}_bothReadsUnmapped.bam"

# Sort for fastq extraction
echo "$(date +"%T") | Sorting of reads for $SAMPLE"
samtools sort -n -m 5G -@ 2 "${OUT_PREFIX}_bothReadsUnmapped.bam" -o "${OUT_PREFIX}_bothReadsUnmapped_sorted.bam"

# Convert to fastq
echo "$(date +"%T") | Converting in fastq $SAMPLE"
samtools fastq "${OUT_PREFIX}_bothReadsUnmapped_sorted.bam" \
  -1 "${OUT_PREFIX}_host_removed_R1.fastq" \
  -2 "${OUT_PREFIX}_host_removed_R2.fastq" \
  -0 /dev/null -s /dev/null -n

echo "$(date +"%T") | Finished $SAMPLE"
done
