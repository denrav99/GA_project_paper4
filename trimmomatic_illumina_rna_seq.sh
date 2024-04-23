#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:30:00
#SBATCH -J trimmomatic_illumina_rna_seq
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/01_preprocessing/trim_data/trimmomatic_illumina_rna_seq.out

# Load modules
module load bioinfo-tools
module load trimmomatic

# Your commands 
trimmomatic PE \
    -threads 2 \
    -phred33 \
    -basein  /home/dera0219/project_paper4/06_data/raw_data/illumina/rna/untrimmed/SRR6040095_scaffold_06.1.fastq.gz \
    -baseout /home/dera0219/project_paper4/01_preprocessing/trim_data/trimmed_rna ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10:8:true LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

