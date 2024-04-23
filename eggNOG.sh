#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 06:00:00
#SBATCH -J eggNOG
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/03_func_struc_annotation/eggNOG/eggNOG_version2/eggNOG2.out

# Load modules
module load bioinfo-tools
module load eggNOG-mapper

# Your commands

fasta_dir=/home/dera0219/project_paper4/03_func_struc_annotation/BRAKER/gffread
BRAKER_gff_file=/home/dera0219/project_paper4/03_func_struc_annotation/BRAKER

emapper.py -m diamond --itype CDS --translate -i "$fasta_dir"/BRAKER_results_converted.fna -o /domus/h1/dera0219/project_paper4/03_func_struc_annotation/eggNOG \
--decorate_gff "$BRAKER_gff_file"/augustus.hints.gff --decorate_gff_ID_field GeneID --cpu 8

