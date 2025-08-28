# pigfarm-environmental-resistome-analysis
Analysis pipeline and resources for studying the environmental resistome of pig farms. Includes scripts for ARG detection and abundance profiling, and a dictionary to harmonize gene annotations across multiple databases. 

Choice of the tools is justified in article "Methodological aspects of investigating the resistome in pig farm environments" https://doi.org/10.1016/j.mimet.2025.107103.

Included scripts:
* fastp QC & trimming
* bowtie and Samtools for cleaning from host contamination
* MEGAHIT assembly
* metaQUAST assembly quality control
* ABRicate search for ARGs against Argannot, CARD, MEGARes, NCBI AMRFinderPlus and Resfinder
* kaiju for microbiome analysis

Dictionary of antimicrobial resistance genes (ARGs) created to harmonize results from five databases used in the study (ARG-ANNOT, CARD, MEGARes, NCBI AMRFinderPlus, ResFinder) based on ARGs detected in Swedish pig farm samples. Standard gene names were assigned through manual curation against the CARD database.

