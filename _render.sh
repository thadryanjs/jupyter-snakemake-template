#!/bin/sh

# adding this in the slurm file impacts the log it's currently writing so I do it here

# Define the path to your file
FILE_PATH="_slurm.out"
LOG_DIR="slurm/logs"

# Check if the file exists
if [ -f "$FILE_PATH" ]; then
    # File exists, proceed with your commands

    # Add a timestamp to the _slurm.out file
    TIMESTAMP=$(date +%Y-%m-%d-%H:%M:%S)
    mv "$FILE_PATH" "_slurm-$TIMESTAMP.out"

    # Store it in the logs directory
    mv "_slurm-$TIMESTAMP.out" "$LOG_DIR/"

    # Delete all files in the logs directory except the 3 most recent
    ls -t "$LOG_DIR" | tail -n +4 | while IFS= read -r file; do
        rm "$LOG_DIR/$file"
    done

fi

# snakemake initialize_books -c1
snakemake format_code -c1
snakemake r_template -c1
snaemake py_template -c1
snakemake julia_template -c1
snakemake build_book -c1

# if using slurm, put the above in _slurm.sh
# sbatch _slurm.sh

