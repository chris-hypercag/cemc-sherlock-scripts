#!/bin/bash
#SBATCH --job-name=autopick-relion
#SBATCH --mail-type=end,fail
#SBATCH --partition=XXXqueueXXX
#SBATCH --ntasks=XXXmpinodesXXX
#SBATCH --cpus-per-task=XXXthreadsXXX
#SBATCH --mem-per-cpu=XXXextra2XXX
#SBATCH --gpus=2
#SBATCH --time=XXXextra1XXX
#SBATCH --error=XXXerrfileXXX
#SBATCH --output=XXXoutfileXXX

# Create record of Slurm Job ID
#
echo "Slurm Job ID: $SLURM_JOB_ID"

# On Sherlock the RELION program is located in the biology module. 
# RELION dependencies such as cuda, mpi, ctffind, motioncorr2 etc. are loaded concurrently with relion/4.0.1.
# 
module load biology
module load py-topaz/0.2.5
module load relion/4.0.1

# Runs command variable supplied by RELION with srun.
#
srun --mem-per-cpu=XXXextra2XXX XXXcommandXXX

exit
