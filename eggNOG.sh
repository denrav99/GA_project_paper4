#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 06:00:00
#SBATCH -J eggNOG
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/03_func_struc_annotation/eggNOG/eggNOG_try2/eggNOG_try2.out

# Load modules
module load bioinfo-tools
module load eggNOG-mapper

# Your commands

chmod a+w /home/dera0219/project_paper4/03_func_struc_annotation/BRAKER/augustus.hints.gff3

fasta_dir=/home/dera0219/project_paper4/03_func_struc_annotation/BRAKER/gffread

emapper.py -m diamond --itype CDS --translate -i "$fasta_dir"/BRAKER_gff3_converted.fna -o /domus/h1/dera0219/project_paper4/03_func_struc_annotation/eggNOG/eggNOG_try2/eggNOG_try2 \
--decorate_gff /home/dera0219/project_paper4/03_func_struc_annotation/BRAKER/augustus.hints.gff3  --cpu 8

