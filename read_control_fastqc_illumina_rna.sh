#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:20:00
#SBATCH -J fastqc_illumina_rnaseq
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/01_preprocessing/read_control/illumina_rna_seq/illumina_rna_fastqc.out


# Load modules
module load bioinfo-tools
module load FastQC

# Your commands

fastqc /home/dera0219/project_paper4/06_data/raw_data/illumina/rna/untrimmed/SRR6040095_scaffold_06.1.fastq.gz -o /home/dera0219/project_paper4/01_preprocessing/read_control/illumina_rna_seq
