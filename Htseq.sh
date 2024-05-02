#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J Htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/04_transcriptome_analysis/HtSeq/HtSeq.out

# Load modules
module load bioinfo-tools
module load htseq

# Your commands

rna_seq_bamfiles_dir=/proj/uppmax2024-2-7/nobackup/work/denise_paper4_bam_files/star_mapping
gff_file=/home/dera0219/project_paper4/03_func_struc_annotation/BRAKER/augustus.hints.gff3

for bam_file in "$rna_seq_bamfiles_dir"/*.bam; do
    htseq-count --format=bam --order=pos -t gene -i ID --stranded=no "$bam_file" "$gff_file" > /home/dera0219/project_paper4/04_transcriptome_analysis/HtSeq/"$(basename "$bam_file" .bam)_count.txt"
done
