#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:25:00
#SBATCH -J quast
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/02_genome_assembly/assembly_quality_control/post_repeatmasker/post_repeatmasker_assembly_control.out

# Load modules
module load bioinfo-tools
module load quast

# Your commands 
python /home/dera0219/project_paper4/05_code/quast/quast.py /home/dera0219/project_paper4/02_genome_assembly/assembly_correction/pilon/pilon.fasta.masked -o /home/dera0219/project_paper4/02_genome_assembly/assembly_quality_control/post_repeatmasker
