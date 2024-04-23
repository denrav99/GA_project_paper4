#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:30:00
#SBATCH -J samtools_flagstats
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/02_genome_assembly/assembly_correction/bwa/samtools_flagstat_bwa_quality_check.out

# Load modules
module load bioinfo-tools
module load samtools

# Your commands
samtools flagstat -@ 2 /proj/uppmax2024-2-7/nobackup/work/denise_paper4_bam_files/bwa/bwa_illumina_alignment_to_uncorrected_assembly.bam > /home/dera0219/project_paper4/02_genome_assembly/assembly_correction/bwa/samtools_flagstat_bwa_quality_check_result.txt
