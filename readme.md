# Readme

This template is for create a new data science project in Python, R, or Julia. It comes with a template conda environment for the Python and R, and a Manifest.toml and Project.toml for Julia. It has Snakemake set up to build books from the scripts using jupytext. It also has a slurm setup. If you're not using slurm, just delete the directory and modify the render file. If you're not using Julia, delete the Manifest.toml and Project.toml files.

- If you're using Python or R, use the conda environment file to create a new environment. Change the name in the file and run:
```bash
conda env create -f environment.yml
```
- If you're using Julia, activate the environment and instantiate the project:


```bash
# need to test this command
julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
```
