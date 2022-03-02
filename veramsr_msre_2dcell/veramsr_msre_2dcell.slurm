#!/bin/bash

# Fixed:
#SBATCH -p corralextra          # Queue (partition) name
#SBATCH -A vera_scaling_startup # Allocation name (req'd if you have more than 1)
# #SBATCH --mail-user=ben.collins@utexas.edu
# #SBATCH --mail-type=all    # Send email at begin and end of job

# Naming Convention
#SBATCH -J veramsr        # Job name
# #SBATCH -o veramsr.o%j    # Name of stdout output file
# #SBATCH -e veramsr.e%j    # Name of stderr error file

# Compute requirements
#SBATCH -N 1                   # Total # of nodes
#SBATCH --ntasks-per-node 1    #tasks per node
#SBATCH -t 00:30:00       # Run time (hh:mm:ss)

export MODULEPATH=/corral-secure/utexas/vera_scaling_startup/VERA/modulefiles/:$MODULEPATH
module load vera

case='veramsr_msre_2dcell.mpact'
proc=$SLURM_NTASK

date
echo "running on: " $proc
cd $SLURM_SUBMIT_DIR
pwd
mpirun -np $proc MPACT.exe ${case}.inp
date
