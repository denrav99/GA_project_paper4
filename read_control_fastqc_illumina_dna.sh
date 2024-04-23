#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:20:00
#SBATCH -J fastqc_illumina_dnaseq
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/01_preprocessing/read_control/illumina_dna_seq/illumina_dna_fastqc_2P.out


# Load modules
module load bioinfo-tools
module load FastQC

# Your commands

fastqc /home/dera0219/project_paper4/06_data/raw_data/illumina/dna/SRR6058604_scaffold_06.2P.fastq.gz -o /home/dera0219/project_paper4/01_preprocessing/read_control/illumina_dna_seq

