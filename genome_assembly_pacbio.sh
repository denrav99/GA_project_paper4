#!/bin/bash -l

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 20:00:00
#SBATCH -J genome_assembly_pacbio
#SBATCH --mail-type=ALL
#SBATCH --mail-user denise.ravinale.0219@student.uu.se
#SBATCH --output=/home/dera0219/project_paper4/02_genome_assembly/genome_assembly_pacbio.out


# Load modules
module load bioinfo-tools
module load Flye

# Your commands

flye --pacbio-raw /home/dera0219/project_paper4/06_data/raw_data/pacbio/SRR6037732_scaffold_06.fq.gz \
--out-dir /home/dera0219/project_paper4/02_genome_assembly --genome-size 26m --threads 4 
 
