#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:30:00
#SBATCH -J samtools_flagstats
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/domus/h1/dera0219/project_paper4/03_func_struc_annotation/star_mapping/flagstat_quality_check_post_star.out

# Load modules
module load bioinfo-tools
module load samtools

# Your commands
samtools flagstat -@ 2 /proj/uppmax2024-2-7/nobackup/work/denise_paper4_bam_files/star_mapping/SRR6040092_Aligned.sortedByCoord.out.bam > /domus/h1/dera0219/project_paper4/03_func_struc_annotation/star_mapping/flagstat_quality_check_post_star_result.txt
