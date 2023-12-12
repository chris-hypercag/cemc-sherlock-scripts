#!/bin/bash
#SBATCH --job-name=standard-relion
#SBATCH --mail-type=end,fail
#SBATCH --ntasks=XXXmpinodesXXX
#SBATCH --cpus-per-task=XXXthreadsXXX
#SBATCH --time=XXXextra1XXX
#SBATCH --mem-per-cpu=XXXextra2XXX
#SBATCH --partition=XXXqueueXXX
#SBATCH --error=XXXerrfileXXX
#SBATCH --output=XXXoutfileXXX

# On Sherlock the RELION program is located in the biology module. 
# RELION dependencies such as cuda, mpi, ctffind, motioncorr2 etc. are loaded concurrently with relion/4.0.1.
# 
module load biology
module load relion/4.0.1

# Run XXXcommandXXX with srun supplied by RELION
#
srun --mem-per-cpu=XXXextra2XXX --gres=none XXXcommandXXX

exit
