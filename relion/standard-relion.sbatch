#!/bin/bash
#SBATCH --job-name=myRelion
#SBATCH --mail-type=end,fail
#SBATCH --ntasks=XXXmpinodesXXX
#SBATCH --cpus-per-task=XXXthreadsXXX
#SBATCH --time=XXXextra1XXX
#SBATCH --mem-per-cpu=XXXextra2XXX
#SBATCH --partition=XXXqueueXXX
#SBATCH --error=XXXerrfileXXX
#SBATCH --output=XXXoutfileXXX

module load contribs
module load cryoem 
module load relion/4.0.1

srun --mem-per-cpu=XXXextra2XXX --gres=none XXXcommandXXX
####the end
