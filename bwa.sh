#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J bwa
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/02_genome_assembly/assembly_correction/bwa/bwa_illumina_alignment_to_uncorrected_assembly.out

# Load modules
module load bioinfo-tools
module load bwa
module load samtools

# Your commands

# Indexing
bwa index -p indexed_reference_genome /home/dera0219/project_paper4/02_genome_assembly/assembly.fasta 

# Alignment
bwa mem -t 2  /home/dera0219/project_paper4/02_genome_assembly/indexed_reference_genome \
/home/dera0219/project_paper4/06_data/raw_data/illumina/dna/SRR6058604_scaffold_06.1P.fastq.gz \
/home/dera0219/project_paper4/06_data/raw_data/illumina/dna/SRR6058604_scaffold_06.2P.fastq.gz \
| samtools view -Sb -  > /proj/uppmax2024-2-7/nobackup/work/denise_paper4_bam_files/bwa/bwa_illumina_alignment_to_uncorrected_assembly.bam
