#!/bin/sh

# adding this in the slurm file impacts the log it's currently writing so I do it here

# add a timestampt to the _slurm.out file
mv _slurm.out _slurm-$(date +%Y-%m-%d-%H:%M:%S).out
# store it
mv _slurm-* slurm/logs/

# this deletes all files in the logs directory except the 3 most recent
ls -t slurm/logs | tail -n +4 | while IFS= read -r file; do
    rm slurm/logs/"$file"
done

snakemake initialize_books -c1
# snakemake format_code -c1
# snakemake build_book -c1

# if using slurm, put the above in _slurm.sh
# sbatch _slurm.sh

