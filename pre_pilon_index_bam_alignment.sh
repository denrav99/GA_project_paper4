#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:30:00
#SBATCH -J pre_pilon_index_bam_alignment
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/02_genome_assembly/assembly_correction/pilon/pre_pilon_index_bam_alignment.out

# Load modules
module load bioinfo-tools
module load samtools

# Your commands
samtools sort -@ 2 -o /proj/uppmax2024-2-7/nobackup/work/denise_paper4_bam_files/bwa/bwa_illumina_alignment_to_uncorrected_assembly_sorted.bam /proj/uppmax2024-2-7/nobackup/work/denise_paper4_bam_files/bwa/bwa_illumina_alignment_to_uncorrected_assembly.bam
samtools index /proj/uppmax2024-2-7/nobackup/work/denise_paper4_bam_files/bwa/bwa_illumina_alignment_to_uncorrected_assembly_sorted.bam
