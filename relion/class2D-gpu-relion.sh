#!/bin/bash
#SBATCH --job-name=class2D-gpu-relion
#SBATCH --mail-type=end,fail
#SBATCH --error=XXXerrfileXXX
#SBATCH --output=XXXoutfileXXX
#SBATCH --partition=XXXqueueXXX
#SBATCH --ntasks=XXXmpinodesXXX
#SBATCH --cpus-per-task=XXXthreadsXXX
#SBATCH --mem-per-cpu=XXXextra2XXX
#SBATCH --time=XXXextra1XXX
#SBATCH XXXextra3XXX
#SBATCH XXXextra4XXX
#SBATCH XXXextra5XXX

# Create record of Slurm Job ID
#
echo "Slurm Job ID: $SLURM_JOB_ID"

# On Sherlock the RELION program is located in the biology module. 
# RELION dependencies such as cuda, mpi, ctffind, motioncorr2 etc. are loaded concurrently with relion/4.0.1.
# 
module load biology
module load relion/4.0.1

# Runs command variable supplied by RELION with srun.
#
mpiexec XXXcommandXXX

exit
