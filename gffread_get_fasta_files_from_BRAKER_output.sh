#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J gffread
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/03_func_struc_annotation/BRAKER/gffread/gffread.out

# Load modules
module load bioinfo-tools
module load bwa
module load gffread

# Your commands
gffread /home/dera0219/project_paper4/03_func_struc_annotation/BRAKER/augustus.hints.gff3 \
-g /home/dera0219/project_paper4/02_genome_assembly/assembly_correction/pilon/pilon.fasta.masked \
-w /home/dera0219/project_paper4/03_func_struc_annotation/BRAKER/gffread/BRAKER_results_converted.fn
