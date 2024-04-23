#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:20:00
#SBATCH -J fastqc_illumina_trimmed_rnaseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/domus/h1/dera0219/project_paper4/01_preprocessing/read_control/illumina_rna_seq/trimmed_rna/trimmed_illumina_rnaseq.out


# Load modules
module load bioinfo-tools
module load FastQC

# Your commands

fastqc /domus/h1/dera0219/project_paper4/01_preprocessing/trim_data/trimmed_rna_1P -o /domus/h1/dera0219/project_paper4/01_preprocessing/read_control/illumina_rna_seq/trimmed_rna
