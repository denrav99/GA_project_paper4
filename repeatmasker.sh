#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 02:00:00
#SBATCH -J repeat_masker
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/02_genome_assembly/assembly_correction/repeat_masker/repeatmasker.out

# Load modules
module load bioinfo-tools
module load RepeatMasker

# Your commands
RepeatMasker -pa 4 -species malvaceae /home/dera0219/project_paper4/02_genome_assembly/assembly_correction/pilon/pilon.fasta
