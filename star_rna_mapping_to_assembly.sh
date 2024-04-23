#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 05:00:00
#SBATCH -J star
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/03_func_struc_annotation/star_mapping/star_map_rna_to_corrected_assembly.out

# Load modules
module load bioinfo-tools
module load star
module load samtools

# generating genome indexes
genome_indices_dir=/proj/uppmax2024-2-7/nobackup/work/denise_paper4_bam_files/star_mapping/genome_indices
masked_genome_assembly=/home/dera0219/project_paper4/02_genome_assembly/assembly_correction/pilon/pilon.fasta.masked

#STAR \
#--runThreadN 8 \
#--runMode genomeGenerate \
#--genomeDir "$genome_indices_dir" \
#--genomeFastaFiles "$masked_genome_assembly"

# mapping RNA to indexed assembly
trimmed_reads_dir=/home/dera0219/project_paper4/06_data/raw_data/illumina/rna/trimmed/trimmed

###### TEST FOR ONE SAMPLE ######

forward_read=/home/dera0219/project_paper4/06_data/raw_data/illumina/rna/trimmed/trimmed/SRR6156067_scaffold_06.1.fastq.gz 

#Extract sample ID from the forward read filename
filename=$(basename "$forward_read")
sample_id="${filename%%_*}"

# Construct file paths for the forward and reverse reads
reverse_read="${forward_read%_scaffold_06.1.fastq.gz}_scaffold_06.2.fastq.gz"
    	
# Run STAR command for each pair of forward and reverse reads
STAR \
--runThreadN 8 \
--genomeDir "$genome_indices_dir" \
--readFilesIn "$forward_read" "$reverse_read" \
--readFilesCommand gunzip -c \
--outFileNamePrefix "${sample_id}_" \
--outSAMtype BAM SortedByCoordinate  
samtools index "${sample_id}_Aligned.sortedByCoord.out.bam"

###### LOOP FOR ALL 8 SAMPLES #######

#for forward_read in "$trimmed_reads_dir"/*_scaffold_06.1.fastq.gz;

#do
	#echo "$forward_read"
	#Extract sample ID from the forward read filename
	#filename=$(basename "$forward_read")
    	#sample_id="${filename%%_*}"    	
    
    	# Construct file paths for the forward and reverse reads
    	#reverse_read="${forward_read%_scaffold_06.1.fastq.gz}_scaffold_06.2.fastq.gz"
    	
	# Run STAR command for each pair of forward and reverse reads
    	STAR \
    	#--runThreadN 8 \
    	#--genomeDir "$genome_indices_dir" \
    	#--readFilesIn "$forward_read" "$reverse_read" \
    	#--readFilesCommand gunzip -c \
	#--outFileNamePrefix "${sample_id}_" \
	#--outSAMtype BAM SortedByCoordinate

	# Index the resulting BAM file
    	#samtools index "${sample_id}_Aligned.sortedByCoord.out.bam"

#done	







