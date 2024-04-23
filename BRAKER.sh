#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 06:00:00
#SBATCH -J BRAKER
#SBATCH --mail-type=ALL 
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/03_func_struc_annotation/BRAKER/BRAKER.out

# Load modules
module load bioinfo-tools
module load braker/2.1.1_Perl5.24.1
module load augustus/3.2.3_Perl5.24.1 
module load bamtools/2.5.1
module load blast/2.9.0+
module load GenomeThreader/1.7.0
module load samtools/1.8
module load GeneMark/4.33-es_Perl5.24.1

cp -vf /sw/bioinfo/GeneMark/4.33-es/snowy/gm_key $HOME/.gm_key

# Copy configuration file for AUGUSTUS
source $AUGUSTUS_CONFIG_COPY
chmod a+w -R /home/dera0219/project_paper4/03_func_struc_annotation/BRAKER/augustus_config/species/


rna_seq_bamfiles_dir=/proj/uppmax2024-2-7/nobackup/work/denise_paper4_bam_files/star_mapping

export AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin
export AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts
export GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy

braker.pl \
--genome=/home/dera0219/project_paper4/02_genome_assembly/assembly_correction/pilon/pilon.fasta.masked \
--bam="$rna_seq_bamfiles_dir"/SRR6040092_Aligned.sortedByCoord.out.bam,"$rna_seq_bamfiles_dir"/SRR6040093_Aligned.sortedByCoord.out.bam,"$rna_seq_bamfiles_dir"/SRR6040094_Aligned.sortedByCoord.out.bam,"$rna_seq_bamfiles_dir"/SRR6040096_Aligned.sortedByCoord.out.bam,"$rna_seq_bamfiles_dir"/SRR6040097_Aligned.sortedByCoord.out.bam,"$rna_seq_bamfiles_dir"/SRR6156066_Aligned.sortedByCoord.out.bam,"$rna_seq_bamfiles_dir"/SRR6156067_Aligned.sortedByCoord.out.bam,"$rna_seq_bamfiles_dir"/SRR6156069_Aligned.sortedByCoord.out.bam \
--cores=8 \
--species=Durio_zibethinus \
--workingdir=/home/dera0219/project_paper4/03_func_struc_annotation/BRAKER/ \
--useexisting \
--softmasking \
--AUGUSTUS_CONFIG_PATH=/home/dera0219/project_paper4/03_func_struc_annotation/BRAKER/augustus_config \
#--AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin \
#--AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts \
#--GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy
 
