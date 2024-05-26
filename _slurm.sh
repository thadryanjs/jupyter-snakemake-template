#!/bin/sh
#SBATCH --job-name=template
#SBATCH --error="_slurm.out"
#SBATCH --output="_slurm.out"
#SBATCH --time=0-01:00:00
#SBATCH --mem=20G
#SBATCH --mail-type=BEGIN,END,FAIL

echo "SLURM ID: $SLURM_JOB_ID" > _slurm.out

# you will need to put your own path here
# source and activate conda
# source /optnfs/common/miniconda3/etc/profile.d/conda.sh

# conda activate jupyter-template
# in case it has been updated
conda env export > environment.yml

snakemake format_code -c1
snakemake r_template -c1
snaemake py_template -c1
snakemake julia_template -c1
snakemake build_book -c1
